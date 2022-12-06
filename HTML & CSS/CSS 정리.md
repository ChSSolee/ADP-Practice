# CSS 정리

웹 페이지의 스타일을 정의하는 CSS 배우기

# CSS 개요

- 웹 페이지의 디자인을 구성
- CSS는 HTML 요소들이 어떻게 보이는가를 정의하는 스타일 시트 언어
- W3C(World Wide Web Consortium)에서 만든 스타일 시트 언어
- HTML만으로 웹 페이지를 만들 경우, 세부 스타일을 각각 따로 설정하므로 매우 많은 시간이 걸리며, 완성한 후에도 스타일의 변경 및 유지 보수가 매우 힘들다는 단점을 CSS를 통해서 해결
- CSS는 별도 파일로 웹 페이지의 스타일을 저장할 수 있고, 사이트의 전체 스타일을 쉽게 제어/변경 가능

## CSS 구성 요소

- 선택자(selector) : 스타일을 적용할 대상 지정
- 속성명(property) : 속성의 이름
- 속성값(value) : 속성에 적용할 값
- 선택자 {속성명 : 속성 값; } 과 같이 사용하여 스타일 적용

```css
p {
  color: purple;
  text-align: center;
}
```

## CSS 적용 방법

- 인라인 스타일 : HTML 요소의 여는태그에 style 속성으로 지정
- 내부 스타일 : 같은 HTML 문서 내부에 <style>태그를 사용하여 지정
- 외부 스타일 : HTML 문서와는 별개의 파일로 style을 지정

### **인라인 스타일(inline style)**

```html
<p style="color: red; background-color: yellow">인라인 스타일</p>
```

### **내부 스타일(internal style)**

```html
<!DOCTYPE html>
<html>
  <head>
    <title>내부 스타일</title>
    <style>
      p {
        color: blue;
        background-color: yellow;
      }
    </style>
  </head>
  <body>
    <p>내부 스타일</p>
  </body>
</html>
```

### **외부 스타일(external style)**

**style.css**

```css
p {
  color: red;
}
```

**index.html**

```html
<!DOCTYPE html>
<html>
  <head>
    <title>외부 스타일<title>
    <link rel="stylesheet" href="css/style.css">
  </head>
  <body>
    <p>외부 스타일</p>
  </body>
</html>
```

## 주석 처리

```css
/* 주석 */
/* 
   주석
*/
```

# CSS 선택자

## 기본 선택자

[기본 선택자 태그 (1)](https://www.notion.so/bde8679544e24603a7d6f90feea726cc)

```css
<!DOCTYPE html>
<html>
  <head>
    <style>
      p {
        background-color: yellow;
      }
      #id1 {
        color: yellow;
        background-color: black;
      }
      .class1 {
        color: blue;
        background-color: yellow;
      }
      p.class1 {
        color: red;
        background-color: navy;
      }
      h1 {
        color: green;
      }
      h1[text] {
        color: purple;
      }
      input[type="password"] {
        background: yellow;
      }
    </style>
  </head>
  <body>
    <p>p</p>
    <p id="id1">id1인 p</p>
    <p class="class1">class1인 p</p>
    <p class="class2">class2인 p</p>
    <h1>h1</h1>
    <h1 text="h1_text">text 속성 h1</h1>
    <form>
      <input type="password">
    </form>
  </body>
</html>
```

‌

## 반응 선택자

[반응 선택자 태그 (1)](https://www.notion.so/3dd59492892c431fa5b1c3a06a8da641)

```css
<!DOCTYPE html>
<html>
  <head>
    <style>
      a:link { color: blue; }
      a:visited { color: purple; }
      a:hover { color: red; }
      a:active { color: black; }
  
      div.d1:hover { background-color: yellow; }
    </style>
  </head>
  <body>
    <a href="www.google.com">구글 링크</a>
    <div class="d1">
      <p>div영역</p>
      <p>class=d1</p>
    </div>
  </body>
</html>
```

## 구조 선택자

[구조 선택자 태그 (1)](https://www.notion.so/9a3ee202e78a4a7dbe6b403c9a5285c8)

```css
<!DOCTYPE html>
<html>
<head>
    <style>
        p { background-color: lightsteelblue; }
        p:nth-child(1) { font-size: 400%; }
        p:nth-child(2) { font-size: 350%; }
        p:nth-child(3) { font-size: 300%; }
        p:nth-child(4) { font-size: 250%; }
        p:nth-child(5) { font-size: 200%; }
        p:nth-child(6) { font-size: 150%; }
        p:nth-child(7) { font-size: 100%; }
    </style>
</head>
<body>
    <p>Suan</p>
    <p>Suan</p>
    <p>Suan</p>
    <p>Suan</p>
    <p>Suan</p>
    <p>Suan</p>
    <p>Suan</p>
</body>
</html>
```

```css
<!DOCTYPE html>
<html>
<head>
    <style>
        th:first-child { border-radius: 10px 0 0 0; }
        th:last-child { border-radius: 0 10px 0 0; }
        tr:nth-child(2n) { background-color: skyblue; }
        tr:nth-child(2n+1) { background-color:lightblue; }
        td:hover { background-color: royalblue; }
    </style>
</head>
<body>
    <table>
        <tr>
            <th>Head</th>
            <th>Head</th>
            <th>Head</th>
        </tr>
        <tr>
            <td>Body</td>
            <td>Body</td>
            <td>Body</td>
        </tr>
        <tr>
            <td>Body</td>
            <td>Body</td>
            <td>Body</td>
        </tr>
        <tr>
            <td>Body</td>
            <td>Body</td>
            <td>Body</td>
        </tr>
    </table>
</body>
</html>
```

## 상태 선택자

form의 상태를 선택하여 사용

[상태 선택자 태그 (1)](https://www.notion.so/79ffffc9a2c643b6aec03b93dff18948)

```css
<!DOCTYPE html>
<html>
<head>
    <title>CSS3 Selector Basic</title>
    <style>
        input:enabled { background-color: skyblue; }
        input:disabled { background-color: darkgray; }
        input:focus { background-color: yellow; }
    </style>
</head>
<body>
    <input>
    <input disabled="disabled"/>
    <input>
</body>
</html>
```

## 기타 선택자

[기타 선택자 태그 (1)](https://www.notion.so/79396f5648be49448455fb7b4de22a5e)

```css
<!DOCTYPE html>
<html>
<head>
    <style>
        div::first-letter { font-size: 30px; }
        div::first-line { color: royalblue; }
        div::selection { background: yellow; color: red; }
    </style>
</head>
<body>
    <div>이수안 컴퓨터 연구소<br />
        SuanLab<br />
        이수안 컴퓨터 연구소
    </div>
</body>
</html>
```

## 선택자 조합

[선택자 조합 방법 (1)](https://www.notion.so/38672bf957df45c99ab7c271837a01cf)

```css
<!DOCTYPE html>
<html>
<head>
    <style>
        div h1 { color: red; }
        h1 + h2 { color: green; }
        h2 ~ h4 { background-color: yellow; }
        h5, h6 { font-size: 200% }
    </style>
</head>
<body>
    <div>
        <h1>Heading 1</h1>
        <h2>Heading 2</h2>
        <h3>Heading 3</h3>
        <h4>Heading 4</h4>
        <h5>Heading 5</h5>
        <h6>Heading 6</h6>
    </div>
</body>
</html>
```

# CSS 스타일

## 박스 스타일

- 웹 페이지에 다양한 요소를 배치하기 위해 사용
- content, padding, border, margin으로 구성
- 웹 페이지의 전체 레이아웃 정의

![https://www.w3.org/TR/CSS2/images/boxdim.png](https://www.w3.org/TR/CSS2/images/boxdim.png)

- content : 실제 내용
- padding : content와 테두리 사이의 공간
- border : 테두리 두께
- margin : 테두리와 최종경계 사이 여백

```css
<!DOCTYPE html>
<html>
<head>
    <style>
        div {
            background-color: orange;
            width: 200px;
            height: 200px;
        }
        p {
            font-size: large;
            font-weight: bold;
            border: 1px solid red;
        }
        div#box0 {
            display: block;
            margin: 40px;
        }
        div#box1 {
            margin: 40px;
            border: 5px solid black;
        }
        div#box2 {
            margin: 40px;
            border: 5px solid black;
            padding: 30px;
        }
        div#box3 {
            margin: 400px 100px 400px 100px;
            border: 5px solid black;
            padding: 100px;
        }
        div#box4 {
            margin: 40px;
            border: 5px solid black;
            padding: 400px 100px 400px 100px;
        }
    </style>
</head>
<body>
    <div>
        <p>div</p>
    </div>
    <div id="box0">
        <p>div#box0</p>
    </div>
    <div id="box1">
        <p>div#box1</p>
        <p>margin: 40px</p>
        <p>padding: 0</p>
    </div>
    <div id="box2">
        <p>div#box2</p>
        <p>margin: 40px</p>
        <p>border: 5px solid black</p>
        <p>padding: 30px</p>
    </div>
    <div id="box3">
        <p>div#box3</p>
        <p>margin: 400px 100px 400px 100px</p>
        <p>border: 5px solid black</p>
        <p>padding: 100px</p>
    </div>
    <div id="box4">
        <p>div#box4</p>
        <p>margin: 40px</p>
        <p>border: 5px solid black</p>
        <p>padding: 400px 100px 400px 100px</p>
    </div>
</body>
</html>
```

## 테두리 스타일

테두리의 두께, 색상, 스타일 정의

```css
<!DOCTYPE html>
<html>
<head>
    <style>
        div {
            width: 200px;
            height: 50px;
            margin: 10px;
        }
        .solid {
            border-style: solid;
        }
        .dotted {
            border-style: dotted;
        }
        .dashed {
            border-style: dashed;
        }
        .double {
            border-style: double;
        }
        .ridge {
            border-style: ridge;
        }
        .groove {
            border-style: groove;
        }
        .inset {
            border-style: inset;
        }
        .outset {
            border-style: outset;
        }
        .mixed {
            border-style: solid dotted dashed double;
        }
        .width-5 {
            border-style: dashed;
            border-width: 5px;
        }
        .mixed-width {
            border-style: solid;
            border-width: 5px 3px 1px 10px;
        }
        .colored {
            border-style: solid;
            border-color: red;
        }
        .rounded {
            border-style: solid;
            border-radius: 10px 5px 0 20px;
        }
    </style>
</head>
<body>
    <div>border: none</div>
    <div class="solid">border-style: solid</div>
    <div class="dotted">border-style: dotted</div>
    <div class="dashed">border-style: dashed</div>
    <div class="double">border-style: double</div>
    <div class="ridge">border-style: ridge</div>
    <div class="groove">border-style: groove</div>
    <div class="inset">border-style: inset</div>
    <div class="outset">border-style: outset</div>
    <div class="mixed">mixed border</div>
    <div class="width-5">border-width 5px</div>
    <div class="mixed-width">mixed 5px 3px 1px 10px</div>
    <div class="colored">colored</div>
    <div class="rounded">rounded</div>
</body>
</html>
```

## 배경 스타일

웹 페이지 배경에 색깔과 배경 이미지 설정

```css
<!DOCTYPE html>
<html>
<head>
    <style>
        body {
            background-color: lightgray;
            background-image: url("http://suanlab.com/assets/images/pattern.png");
            /* background-size: 100%; */
            background-repeat: no-repeat; /* repeat-x, repeat-y, no-repeat */
            background-attachment: scroll; /* fixed, scroll */
            background-position: top; /* top, bottom, left, right */
        }
        p {
            font-size: xx-large;
            font-weight: bold;
            color: gray;
        }
    </style>
</head>
<body>
    <p>Background Example</p><br />
    <p>Background Example</p><br />
    <p>Background Example</p><br />
    <p>Background Example</p><br />
    <p>Background Example</p><br />
    <p>Background Example</p><br />
    <p>Background Example</p><br />
</body>
</html>
```

## 글자 스타일

글자 크기, 위치, 폰트 스타일 설정

```css
<!DOCTYPE html>
<html>
<head>
    <style>
        .large {
            font-size: large;
        }
        .small {
            font-size: small;
        }
        .size30 {
            font-size: 30px;
        }
        .center {
            text-align: center;
        }
        .right {
            text-align: right;
        }
        .roman {
            font-family: "Times New Roman", sans-serif;
        }
        .bold {
            font-weight: bold;
        }
        .italic {
            font-style: italic;
        }
    </style>
</head>
<body>
    <p class="large">font-size: large</p>
    <p class="small">font-size: small</p>
    <p class="size30">font-size: 30px</p>
    <p class="roman">font-family: "Times New Roman"</p>
    <p class="center bold">center bold</p>
    <p class="right italic">right italic</p>
</body>
</html>
```

## 링크 스타일

앵커 태그의 다양한 스타일 설정

```css
<!DOCTYPE html>
<head>
    <style>
        div {
            text-align: center;
        }
        a {
            font-size: xx-large;
            margin: 10px;
        }
        a#link_1:link{
            color: darkslateblue;
        }
        a#link_1:visited {
            color: orange;
        }
        a#link_1:hover {
            color: cornflowerblue;
        }
        a#link_2 {
            color: darkgreen;
            text-decoration: none;
        }
        a#link_2:hover {
            text-decoration: underline;
            color: limegreen;
        }
        a#link_2:active {
            background-color: black;
        }
        a#link_3:link, a#link_3:visited {
            background-color: black;
            color: white;
            padding: 5px;
            text-decoration: none;
        }
        a#link_3:hover, a#link_3:active {
            background-color: gray;
        }
        a#link_4:link, a#link_4:visited {
            border: 3px solid forestgreen;
            color: black;
            background-color: white;
            padding: 10px;
            text-decoration: none;
        }
        a#link_4:hover, a#link_4:active {
            background-color: forestgreen;
            color: white;
        }
        button {
            background-color: black;
            color: white;
            padding: 5px;
        }
        button:hover {
            color: red;
        }
    </style>
</head>
<body>
    <div>
        <a id="link_1" href="http://www.google.com">First Link</a><br><br>
        <a id="link_2" href="http://www.google.com">Second Link</a><br><br>
        <a id="link_3" href="http://www.google.com">Third Link</a><br><br>
        <a id="link_4" href="http://www.google.com">Fourth Link</a><br><br>
        <button onclick="location.href='http://www.google.com'">Button Link</button>
    </div>
</body>
</html>
```

## 테이블 스타일

테이블 테두리, 색상, 여백 스타일 설정

```css
<!DOCTYPE html>
<html>
<head>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
            height: auto;
            text-align: left;
        }
        caption {
            margin: 10px;
            background-color: greenyellow;
        }
        table, th, td {
            border-bottom: 1px solid green;
        }
        th, td {
            padding: 10px 20px;
        }
        tr:hover {
            background-color: greenyellow;
        }
        .right {
            text-align: right;
        }
    </style>
</head>
<body>
    <table>
        <caption>영양 성분 표시</caption>
        <tr>
            <th>메뉴</th>
            <th>열량(kcal)</th>
            <th>단백질(g)</th>
            <th>나트륨(mg)</th>
            <th>당류(g)</th>
            <th>포화지방(g)</th>
        </tr>
        <tr>
            <td>치킨버거</td>
            <td>527</td>
            <td>20(36)</td>
            <td>1123(56)</td>
            <td>10</td>
            <td>5(33)</td>
        </tr>
        <tr>
            <td>불고기버거</td>
            <td>390</td>
            <td>17(31)</td>
            <td>713(36)</td>
            <td>8</td>
            <td>7.4(49)</td>
        </tr>
        <tr>
            <td>치즈버거</td>
            <td>559</td>
            <td>22(41)</td>
            <td>681(38)</td>
            <td>7</td>
            <td>14.6(97)</td>
        </tr>
        <tr>
            <td>새우버거</td>
            <td>421</td>
            <td>14(26)</td>
            <td>685(34)</td>
            <td>5</td>
            <td>4(27)</td>
        </tr>
        <tr>
            <td>와규버거</td>
            <td>457</td>
            <td>23(43)</td>
            <td>658(33)</td>
            <td>8</td>
            <td>4.4(29)</td>
        </tr>
    </table>
    <p class="right">( ) 안은 1일 영양성분 기준치에 대한 비율(%)</p>
</body>
</html>
```

# CSS 속성

## 가시 속성

다양한 가시 속성과 투명도 설정

```css
<!DOCTYPE html>
<html>
<head>
    <style>
        div {
            width: 100px;
            height: 100px;
            margin: 20px;
            background-color: skyblue;
        }
        .inline {
            display: inline;
        }
        .block {
            display: block;
        }
        .inline-block {
            display: inline-block;
        }
        .none {
            display: none;
        }
        .visible {
            visibility: visible;
        }
        .hidden {
            visibility: hidden;
        }
        .half-transparent {
            opacity: 0.5;
        }
        .opacity {
            opacity: 0
        }
        .opacity:hover {
            opacity: 1;
        }
    </style>
</head>
<body>
    <h1>display</h1>
    <p class="inline">p inline #1</p>
    <p class="inline">p inline #2</p>
    <span class="block">span block #1</span>
    <span class="block">span block #2</span>
    <div class="inline-block">box1</div>
    <div class="none">box2</div>
    <div class="inline-block">box3</div>
    <hr>
    <h1>visibility</h1>
    <div class="visible">visible</div>
    <div class="hidden">hidden</div>
    <div class="visible">visible</div>
    <hr>
    <h1>opacity</h1>
    <div class="half-transparent">opacity: 0.5</div>
    <div class="opacity">opacity: 0</div>
</body>
</html>
```

## 위치(position) 속성

위치 지정을 위한 다양한 속성

```css
<!DOCTYPE html>
<html>
<head>
    <style>
        div {
            width: 150px;
            height: 150px;
            font-size: xx-large;
            font-weight: bold;
            background-color: lightblue;
            border: 1px solid black;
        }
        div.static {
            position: static;
        }
        div.relative {
            position: relative;
            top: 20px;
            left: 20px;
        }
        div.fixed {
            position: fixed;
            bottom: 0;
            right: 0;
        }
        div.absolute {
            position: absolute;
            right: 0;
            top: 100px;
        }
        p {
            font-size: xx-large;
            font-weight: bold;
            color: gray;
        }
        p.sticky {
            background-color: lightblue;
            position: sticky;
            top: 0;
        }
    </style>
</head>
<body>
    <div class="static">static</div>
    <div class="relative">relative</div>
    <div class="fixed">fixed</div>
    <div class="absolute">absolute</div>
    <br>
    <p class="sticky">sticky</p>
    <p>Position Example</p>
    <p>Position Example</p>
    <p>Position Example</p>
    <p>Position Example</p>
    <p>Position Example</p>
    <p>Position Example</p>
    <p>Position Example</p>
    <p>Position Example</p>
    <p>Position Example</p>
    <p>Position Example</p>
</body>
</html>
```

```css
<!DOCTYPE html>
<html>
<head>
    <style>
        div {
            position: absolute;
            width: 150px;
            height: 150px;
            font-size: large;
            font-weight: bold;
            background-color: lightblue;
            border: 2px solid darkblue;
        }
        #box1 {
            top: 0;
            left: 0;
            z-index: -1;
        }
        #box2 {
            top: 30px;
            left: 30px;
            z-index: 0;
        }
        #box3 {
            top: 60px;
            left: 60px;
            z-index: 1;
        }
        #box4 {
            top: 0;
            left: 500px;
            z-index: 1;
        }
        #box5 {
            top: 30px;
            left: 530px;
            z-index: 0;
        }
        #box6 {
            top: 60px;
            left: 560px;
            z-index: -1;
        }
    </style>
</head>
<body>
    <div id="box1">box1</div>
    <div id="box2">box2</div>
    <div id="box3">box3</div>
    <div id="box4">box4</div>
    <div id="box5">box5</div>
    <div id="box6">box6</div>
</body>
</html>
```

## overflow 속성

```css
<!DOCTYPE html>
<html>
<head>
    <style>
        div {
            width: 300px;
            height: 200px;
            margin: 30px;
        }
        .scroll {
            overflow: scroll;
        }
        .hidden {
            overflow: hidden;
        }
        .overflow-xy {
            overflow-x: hidden;
            overflow-y: scroll;
        }
    </style>
</head>
<body>
    <div class="scroll">
        <p>
            동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세.<br />
            무궁화 삼천리 화려 강산 대한 사람, 대한으로 길이 보전하세.<br />
        </p>
        <p>
            남산 위에 저 소나무, 철갑을 두른 듯 바람 서리 불변함은 우리 기상일세.<br />
            무궁화 삼천리 화려 강산 대한 사람, 대한으로 길이 보전하세.<br />
        </p>
        <p>
            가을 하늘 공활한데 높고 구름 없이 밝은 달은 우리 가슴 일편단심일세.<br />
            무궁화 삼천리 화려 강산 대한 사람, 대한으로 길이 보전하세.<br />
        </p>
        <p>
            이 기상과 이 맘으로 충성을 다하여 괴로우나 즐거우나 나라 사랑하세.<br />
            무궁화 삼천리 화려 강산 대한 사람, 대한으로 길이 보전하세.<br />
        </p>
    </div>
    <div class="hidden">
        <p>
            동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세.<br />
            무궁화 삼천리 화려 강산 대한 사람, 대한으로 길이 보전하세.<br />
        </p>
        <p>
            남산 위에 저 소나무, 철갑을 두른 듯 바람 서리 불변함은 우리 기상일세.<br />
            무궁화 삼천리 화려 강산 대한 사람, 대한으로 길이 보전하세.<br />
        </p>
        <p>
            가을 하늘 공활한데 높고 구름 없이 밝은 달은 우리 가슴 일편단심일세.<br />
            무궁화 삼천리 화려 강산 대한 사람, 대한으로 길이 보전하세.<br />
        </p>
        <p>
            이 기상과 이 맘으로 충성을 다하여 괴로우나 즐거우나 나라 사랑하세.<br />
            무궁화 삼천리 화려 강산 대한 사람, 대한으로 길이 보전하세.<br />
        </p>
    </div>
    <div class="overflow-xy">
        <p>
            동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세.<br />
            무궁화 삼천리 화려 강산 대한 사람, 대한으로 길이 보전하세.<br />
        </p>
        <p>
            남산 위에 저 소나무, 철갑을 두른 듯 바람 서리 불변함은 우리 기상일세.<br />
            무궁화 삼천리 화려 강산 대한 사람, 대한으로 길이 보전하세.<br />
        </p>
        <p>
            가을 하늘 공활한데 높고 구름 없이 밝은 달은 우리 가슴 일편단심일세.<br />
            무궁화 삼천리 화려 강산 대한 사람, 대한으로 길이 보전하세.<br />
        </p>
        <p>
            이 기상과 이 맘으로 충성을 다하여 괴로우나 즐거우나 나라 사랑하세.<br />
            무궁화 삼천리 화려 강산 대한 사람, 대한으로 길이 보전하세.<br />
        </p>
    </div>
</body>
</html>
```

## float 속성

```css
<!DOCTYPE html>
<html>
<head>
    <style>
        div {
            margin: 50px;
            width: 450px;
            border: 2px solid black;
            padding: 20px;
        }
        img {
            margin: 5px;
        }
        .float-right {
            float: right;
        }
        .float-left {
            float: left;
        }
    </style>
</head>
<body>
    <div>
        <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/0/09/Flag_of_South_Korea.svg/225px-Flag_of_South_Korea.svg.png" width="200px">
        <p>
            동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세.<br />
            무궁화 삼천리 화려 강산 대한 사람, 대한으로 길이 보전하세.<br />
        </p>
        <p>
            남산 위에 저 소나무, 철갑을 두른 듯 바람 서리 불변함은 우리 기상일세.<br />
            무궁화 삼천리 화려 강산 대한 사람, 대한으로 길이 보전하세.<br />
        </p>
        <p>
            가을 하늘 공활한데 높고 구름 없이 밝은 달은 우리 가슴 일편단심일세.<br />
            무궁화 삼천리 화려 강산 대한 사람, 대한으로 길이 보전하세.<br />
        </p>
        <p>
            이 기상과 이 맘으로 충성을 다하여 괴로우나 즐거우나 나라 사랑하세.<br />
            무궁화 삼천리 화려 강산 대한 사람, 대한으로 길이 보전하세.<br />
        </p>
    </div>
    <div>
        <img class="float-left" src="https://upload.wikimedia.org/wikipedia/commons/thumb/0/09/Flag_of_South_Korea.svg/225px-Flag_of_South_Korea.svg.png" width="200px">
        <p>
            동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세.<br />
            무궁화 삼천리 화려 강산 대한 사람, 대한으로 길이 보전하세.<br />
        </p>
        <p>
            남산 위에 저 소나무, 철갑을 두른 듯 바람 서리 불변함은 우리 기상일세.<br />
            무궁화 삼천리 화려 강산 대한 사람, 대한으로 길이 보전하세.<br />
        </p>
        <p>
            가을 하늘 공활한데 높고 구름 없이 밝은 달은 우리 가슴 일편단심일세.<br />
            무궁화 삼천리 화려 강산 대한 사람, 대한으로 길이 보전하세.<br />
        </p>
        <p>
            이 기상과 이 맘으로 충성을 다하여 괴로우나 즐거우나 나라 사랑하세.<br />
            무궁화 삼천리 화려 강산 대한 사람, 대한으로 길이 보전하세.<br />
        </p>
    </div>
    <div>
        <img class="float-right" src="https://upload.wikimedia.org/wikipedia/commons/thumb/0/09/Flag_of_South_Korea.svg/225px-Flag_of_South_Korea.svg.png" width="200px">
        <p>
            동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세.<br />
            무궁화 삼천리 화려 강산 대한 사람, 대한으로 길이 보전하세.<br />
        </p>
        <p>
            남산 위에 저 소나무, 철갑을 두른 듯 바람 서리 불변함은 우리 기상일세.<br />
            무궁화 삼천리 화려 강산 대한 사람, 대한으로 길이 보전하세.<br />
        </p>
        <p>
            가을 하늘 공활한데 높고 구름 없이 밝은 달은 우리 가슴 일편단심일세.<br />
            무궁화 삼천리 화려 강산 대한 사람, 대한으로 길이 보전하세.<br />
        </p>
        <p>
            이 기상과 이 맘으로 충성을 다하여 괴로우나 즐거우나 나라 사랑하세.<br />
            무궁화 삼천리 화려 강산 대한 사람, 대한으로 길이 보전하세.<br />
        </p>
    </div>
</body>
</html>
```