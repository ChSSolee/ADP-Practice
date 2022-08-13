getwd()

library(devtools); library(sf); library(purrr); library(dplyr); library(DT) 
library(rgdal); library(lattice); library(latticeExtra); library(lubridate) 
library(ggplot2); library(ggfortify); library(ggrepel); library(showtext)   
library(leaflet); library(leaflet.extras); library(raster); library(shiny)  
library(mapview); library(mapedit); library(grid); library(tidyverse)

ggplot2::theme_set(theme_bw())

require(showtext)
font_add_google(name = "Black Han Sans", family = "blackhansans",
                regular.wt = 400, bold.wt = 700)
showtext_auto()

load("./06_geodataframe/06_apt_price.rdata")      # 아파트 실거래 데이터
load("./07_map/07_kde_high.rdata")    # 최고가 래스터 이미지
load("./07_map/07_kde_hot.rdata")     # 급등지역 래스터 이미지
load("./06_geodataframe/grid.rdata")  # 서울시 경계선
load("./06_geodataframe/bnd.rdata")  # 서울시 1km 그리드

pcnt_10 <- as.numeric(quantile(apt_price$py, probs = seq(0, 1, by = .1))[2])
pcnt_90 <- as.numeric(quantile(apt_price$py, probs = seq(0, 1, by = .1))[10])

load("./01_code/circle_marker/circle_marker.rdata")
circle.colors <- sample(x = c("red", "green", "blue"), size = 1000, replace = T)

library(sf)

grid <- grid %>% as("Spatial")
grid <- as(grid, "sfc")

grid <- grid[which(sapply(st_contains(st_sf(grid), apt_price), length) > 0)]

ui <- fluidPage(
    fluidRow(
        column( 9, selectModUI("selectmap"), div(style = "height:45px")),
        column( 3, sliderInput("range_time", "Construction Year (건축 연도)", 
                               sep = "", min = 1960, max = 2020, value = c(1970, 2020)),
               sliderInput("range_area", "Area (면적)", sep = "",
                           min = 0,  max = 350, value = c(0, 200)), )),
    
    tabsetPanel(
        tabPanel("Chart",
                column(4, h5("Price Range (가격 분포)", align = "center"),
                       plotOutput("density", height = 300), ),
                column(4, h5("Price Trends (가격 추세)", align = "center"),
                       plotOutput("regression", height = 300)),
                column(4, h5("PCA (주성분 분석)", align = "center"),
                       plotOutput("pca", height = 300)), ),
        tabPanel("Table", DT::dataTableOutput("table"))
    )
)

server <- function(input, output, session) {


    all = reactive({
        all = subset(apt_price, 
                         con_year >= input$range_time[1] &
                         con_year <= input$range_time[2] &
                         area >= input$range_area[1] &
                         area <= input$range_area[2])
    return(all)}) 

    g_sel <- callModule(selectMod, "selectmap",
                        leaflet() %>%
                        addTiles(options = providerTileOptions(minZoom = 9, maxZoom = 18)) %>% 
                        addRasterImage(raster_high, 
                                       colors = colorNumeric(c("blue", "green","yellow","red"),
                                                             values(raster_high),
                                                             na.color = "transparent"), 
                                       opacity = 0.4, group = "2021 최고가") %>%
                        addRasterImage(raster_hot, 
                                       colors = colorNumeric(c("blue", "green","yellow","red"), 
                                                             values(raster_hot),
                                                             na.color = "transparent"),
                                       opacity = 0.4, group = "2021 급등지") %>%
                        addLayersControl(baseGroups = c("2021 최고가", "2021 급등지"), 
                                         options = layersControlOptions(collapsed = FALSE)) %>%
                        addPolygons(data = bnd, weight = 3, stroke = T,
                                    color = "red", fillOpacity = 0) %>%
                        addCircleMarkers(data = apt_price, 
                                         lng = unlist(map(apt_price$geometry,1)),
                                         lat = unlist(map(apt_price$geometry,2)),
                                         radius = 10, stroke = FALSE,
                                         fillOpacity = 0.6, 
                                         fillColor = circle.colors, 
                                         weight = apt_price$py, 
                                         clusterOptions = markerClusterOptions(iconCreateFunction = JS(avg.formula))) %>%
                        leafem::addFeatures(st_sf(grid), 
                            layerId = ~ seq_len(length(grid)), 
                            color = 'grey')
    )


    rv <- reactiveValues(intersect = NULL, selectgrid = NULL)                                 
    observe({
        gs <- g_sel()
        rv$selectgrid <- st_sf(grid[as.numeric(gs[which(gs$selected == TRUE),"id"])])
        if(length(rv$selectgrid) > 0) {
            rv$intersect <- st_intersects(rv$selectgrid, all())
            rv$sel <- st_drop_geometry(apt_price[apt_price[unlist(rv$intersect[1:10]),],])
        } else {
            rv$intersect <- NULL
        }
    })
    
    ### 탭1 - Density
    output$density <- renderPlot({
        if (nrow(rv$intersect) == 0)
            return(NULL)
        max_all  <- density(all()$py)  ; max_all <- max(max_all$y)
        max_sel  <- density(rv$sel$py) ; max_sel <- max(max_sel$y)
        plot_high  <- max(max_all, max_sel)
        avg_all <- mean(all()$py)
        avg_sel <- mean(rv$sel$py)
        plot(stats::density(all()$py), xlab=NA, ylab=NA, ylim=c(0, plot_high),
             col="blue", lwd=3, main= NA)
        abline(v = avg_all, lwd = 2, col = "blue", lty=2)
        text(avg_all + (avg_all)*0.13, plot_high * 0.1, 
             sprintf("%.0f", avg_all), srt=0.2, col = "blue")
        lines(stats::density(rv$sel$py), ylim=c(0, plot_high), 
              col="red", lwd=3, main= NA)
        abline(v = avg_sel, lwd = 2, col = "red", lty=2)
        text(avg_sel + (avg_sel)*0.13, plot_high * 0.3, 
             sprintf("%.0f", avg_sel), srt=0.2, col = "red")
  })
    
    ### 탭1 - regression
    output$regression <- renderPlot({
        if (nrow(rv$intersect) == 0)
            return(NULL)
        all1 <- all() %>% data.frame() %>% group_by(ym) %>%
            summarise(all_avg_py = mean(py))
        sel1 <- rv$sel %>% data.frame() %>% group_by(ym) %>%
            summarise(sel_avg_py = mean(py))
        fit_all1 <- lm(all1$all_avg_py ~ all1$ym)
        fit_sel1 <- lm(sel1$sel_avg_py ~ sel1$ym)
        coef_all <- round(summary(fit_all1)$coefficient[2], 1) * 365
        coef_sel <- round(summary(fit_sel1)$coefficient[2], 1) * 365
        grob_1 <- grobTree(textGrob(paste0("전체지역: ", coef_all, "만원(평당)"),
                                    x = 0.05, y = 0.85, hjust = 0, 
                                    gp = gpar(col = "blue", fontsize = 13)))
        grob_2 <- grobTree(textGrob(paste0("관심지역: ", coef_sel, "만원(평당)"), 
                                    x = 0.05, y = 0.95, hjust = 0, 
                                    gp = gpar(col = "red", fontsize = 16)))
        gg <- ggplot(sel1, aes(x = ym , y = sel_avg_py)) + 
            geom_smooth(color = "red", size = 1.5, se = F) + 
            xlab("월") + ylab("가격") + 
            stat_smooth(method = "lm", colour = "dark grey", linetype = "dashed", se = F)
        gg + geom_smooth(data = all1, aes(x = ym, y = all_avg_py), color = "blue", size = 1, se = F) +
            annotation_custom(grob_1) + 
            annotation_custom(grob_2)
    })
    
    ### 탭1 - pca
    output$pca <- renderPlot({
        if (nrow(rv$intersect) == 0)
            return(NULL)
        pca_01 <- rv$sel %>% group_by(apt_nm) %>% 
            summarise(avg_con_year = mean(con_year),
                      avg_floor = mean(floor),
                      avg_py = mean(py),
                      avg_area = mean(area))
        colnames(pca_01) <- c("apt_nm", "신축", "층수", "가격", "면적")
        m <- prcomp(~ 신축 + 층수 + 가격 + 면적, data = pca_01, scale = T)
        autoplot(m, loadings.label = T, loadings.label.size = 4) + 
            geom_label_repel(aes(label = pca_01$apt_nm), size = 3, alpha = 0.7)
 
    })

    #### 탭2 - Table
    output$table <- DT::renderDataTable({
                dplyr::select(rv$sel, ymd, addr_1, apt_nm, price, area, floor, py) %>%
                    arrange(desc(py))}, 
                extensions = 'Buttons', 
                        options = list(dom = 'Bfrtip', scrollY = 300, 
                                       scrollCollapse = T, paging = TRUE, buttons = c('excel')))
}

shinyApp(ui, server)
