# HTML 정리

HTML 개요와 구조 그리고 태그 사용 배우기

# HTML 개요

HTML은 웹페이지의 뼈대를 구성하는 언어

## HTML 문서 기본 구조

```html
<!DOCTYPE html>
<html>
  <head>
    <title>HTML 문서</title>
  </head>
  <body>
    <h1>제목</h1>
    <p>단락</p>
  </body>
</html>
```

- `<!DOCTYPE>`: 현재 문서의 HTML 타입을 정의하며 HTML5 의 경우 `<!DOCTYPE html>`로 명시함
- `<html>`: HTML 문서의 시작과 끝을 표시
- `<head>`: 웹 페이지 문서에 대한 정보로 메타데이터(metadata)를 정의
    - `<style>`, `<meta>`, `<link>`, `<script>`, `<base>` 태그 등 정의
    - `<title>`: HTML 문서 제목(title) 정의
- `<body>`: 내부에 웹 페이지의 실제적인 내용(content)을 작성
    - `<h1>`~`<h6>`: 제목(heading) 정의
    - `<p>`: 단락(paragraph) 정의
    

## HTML 문서 요소(Element)

```html
<title>웹 페이지 제목</title>
```

- 기본적으로 태그(tag)는 시작 태그와 종료 태그로 짝지어 구성
    - 시작 태그: `<title>`
    - 종료 태그: `</title>`

```html
<p class="value">단락</p>
```

- HTML 요소는 여러 속성을 가짐
    - 태그 이름: `p`
    - 속성명: `class`
    - 속성값: `value`
    - 내용: `단락`

## 속성(Attributes)

```html
<a href="링크주소">링크</a>
```

- 요소에 추가적인 정보 및 설정 적용
- 속성 이름은 대소문자를 구분하지 않지만, 소문자를 권장
- 시작 태그에 `속성이름 = "값"` 형태로 사용됨
- `<a>` 태그에 `href` 속성으로 `링크주소`의 값을 설정

## HTML 주석(Comments)

```html
<!-- 주석 -->
```

- 주석은 웹 브라우저가 해석하지 않으며 사용자에게도 보여지지 않음
- 코드의 설명을 위해 작성

## HTML 문서 작성 규칙

```html
<!DOCTYPE html>
<html>
<title>공백 처리 예제</title>
<body>
  공             백
  줄바꿈
  줄바꿈
</body>
</html>
```

- content 내의 연속된 공백 또는 줄 바꿈은 하나의 공백으로 처리
- 여러 개의 공백이나 탭, 줄 바꿈 등은 다른 특수문자를 사용하여 표현

```html
<!DOCTYPE html>
<html>
<title>잘못된 태그 예제</title>
<body>
  <h> 잘못된
  <p> 태그
  </h>
  </p>
</body>
</html>
```

- 태그 이름은 대소문자를 구분하지 않으나 보통 소문자로 작성
- 각 태그는 시작 태그와 종료 태그 쌍이 서로 교차되면 안됨

```html
<p></p>
<p/>
```

- 태그는 시작 태그와 종료 태그를 함께 사용하며 태그의 내용이 공백이면 다음과 같이 사용가능
- 태그는 포함관계를 들여쓰기를 통해 표시하여 작성

# HTML 기본 태그

## 텍스트 요소 태그

### **제목 태그**

```html
<h1>Heading 1</h1>
<h2>Heading 2</h2>
<h3>Heading 3</h3>
<h4>Heading 4</h4>
<h5>Heading 5</h5>
<h6>Heading 6</h6>
```

- `<h>` 태그는 제목을 표시할 때 사용
- `<h1>` 부터 `<h6>` 까지 단계별로 사용

### **단락 태그**

```html
<p>단락</p>
```

- `<p>` 태그는 문단(paragraph)을 나타낼 때 사용
- 문단 전 후로 줄 빈 줄이 추가됨

### **줄 나누기 태그**

```html
<p>
    줄 나누기<br>
    줄 나누기<br>
</p>
```

- `<br>` 태그는 강제로 줄 바꿈을 할 때 사용하는 태그
- 종료 태그가 없음

### **미리 정의된 서식 태그**

```html
<pre>
텍스트 서식
서식을      그대로     출력
서식    출력
</pre>
```

- `<pre>` 태그는 preformatted text로 입력한 텍스트 그대로 화면에 표시할 때 사용하는 태그

### **수평선 태그**

```html
<p>단락</p>
<hr>
<p>단락</p>
<hr>
<p>단락</p>
```

- `<hr>`은 수평선을 표시하는 태그

## 텍스트 서식 태그

[텍스트 서식 태그 (1)](https://www.notion.so/3aad73cdb7e746419e8ec80cf26b5814)

```html
<b>굵게</b>
<i>이텔릭</i>
<small>작게</small>
<ins>밑줄</ins>
<del>가운데 선</del>
<mark>하이라이트</mark>
<strong>중요</strong>
<code>코드</code>
<em>강조</em>
<sup>위 첨자</sup>
<sub>아래 첨자</sub>
```

## 인용 태그

### 인용구(quotation)

짧은 인라인으로 사용

```html
<q>인용구</q>
```

### 블록 인용구(block quotation)

다른 소스에서 인용되는 부분을 블록으로 정의

```html
<blockquote>
    길이가 긴 인용구는 블록 인용구 태그를 사용하여 별도 단락으로 표현 가능
</blockquote>
```

### 약어(abbreviation)

약어 정의

```html
<abbr title="HyperText Markup Language">HTML</abbr>
```

### 인용(citation)

인용되는 작품의 제목

```html
<cite>The Matrix</cite>
```

### 주소(address)

문서 작성자/소유자 연락처 정의

```html
<address>서울특별시 중구 명동 세종대로 110</address>
```

## 앵커 태그

```html
<a href="www.google.com" target="_blank">구글</a>
```

```html
<a href="#content1">Content 1</a>
<a href="#content2">Content 2</a>
<a href="#content3">Content 3</a>
<hr>
<h1 id="content1">Content 1</h1>
<h1 id="content2">Content 2</h1>
<h1 id="content3">Content 3</h1>
```

- `<a>`는 다른 사이트로 통하는 링크나 같은 페이지의 다른 위치로 이동하는 링크를 만들 때 사용
- `href` 속성에 값을 설정하여 이동할 곳 지정
- `target` 속성을 통해 새로운 페이지가 열릴 곳을 지정
    - `_blank` : 새로운 창
    - `_self` : 현재 창
    - `_parent` : 웹 브라우저 부모 창
    - `_top` : 웹 브라우저 전체 영역

## 리스트 태그

### 순서가 없는 리스트(unordered list)

```html
<ul>
    <li>HTML</li>
    <li>CSS</li>
    <li>JavaScript</li>
</ul>
<ul style="list-style-type: circle">
    <li>HTML</li>
    <li>CSS</li>
    <li>JavaScript</li>
</ul>
<ul style="list-style-type: square">
    <li>HTML</li>
    <li>CSS</li>
    <li>JavaScript</li>
</ul>
```

- `<ul>` 태그를 사용하여 전체 리스트 표현
- `<li>` 태그를 사용하여 각 항목을 입력 (list item)

### 순서가 있는 리스트(ordered list)

```html
<ol>
    <li>HTML</li>
    <li>CSS</li>
    <li>JavaScript</li>
</ol>
<ol type="i">
    <li>HTML</li>
    <li>CSS</li>
    <li>JavaScript</li>
</ol>
<ol type="A">
    <li>HTML</li>
    <li>CSS</li>
    <li>JavaScript</li>
</ol>
<ol type="I">
    <li>HTML</li>
    <li>CSS</li>
    <li>JavaScript</li>
</ol>
<ol type="a">
    <li>HTML</li>
    <li>CSS</li>
    <li>JavaScript</li>
</ol>
```

- `<ol>` 태그를 사용하여 전체 리스트 표현
- `<li>` 태그를 사용하여 각 항목을 입력

### 정의 리스트(definitionlist)

```html
<dl>
    <dt>HTML</dt>
    <dd>웹 페이지를 위한 마크업 언어</dd>
    <dt>CSS</dt>
    <dd>마크업 언어가 실제 표시되는 방법을 기술하는 언어</dd>
    <dt>JavaScript</dt>
    <dd>웹 브라우저 내에서 주로 사용되는 객체 기반의 스크립트 프로그래밍 언어</dd>
</dl>
```

- `<dl>` 태그를 사용하여 전체 리스트 표현
- 각 항목은 `<dt>` 태그를 사용하며 각 설명은 `<dd>` 태그를 사용

## 테이블 태그

```html
<table border="1">
  <caption>테이블 1</caption>
  <tr>
    <th>이름</th>
    <th>성별</th>
  </tr>
  <tr>
    <td>이수안</td>
    <td>남자</td>
  <tr>
    <td>이소은</td>
    <td>여자</td>
  </tr>
</table>
```

- `<table>` ~ `</table>`: 테이블 생성
- `<tr>` ~ `</tr>`: 테이블의 행(row) 생성
- `<th>` ~ `</th>`: 테이블의 헤드(head) 생성
- `<td>` ~ `</td>`: 테이블의 열(column) 생성
- `<caption>` ~ `</caption>`: 테이블의 캡션 설정
- `<rowspan>`: 셀을 세로로 병합, 병합하고 싶은 행의 수를 설정
- `<colspan>`: 셀을 가로로 병합, 병합하고 싶은 열의 수를 설
- 시간표 만들기
    
    ```html
    <table border="1">
        <caption>시간표</caption>
        <thead>
            <tr>
                <th rowspan=2>교시</th>
                <th colspan=5>요일</th>
            </tr>
            <tr>
                <th>월</th>
                <th>화</th>
                <th>수</th>
                <th>목</th>
                <th>금</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>1교시</td>
                <td>컴퓨터개론</td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td>2교시</td>
                <td></td>
                <td>머신러닝</td>
                <td></td>
                <td>웹과인터넷</td>
                <td></td>
            </tr>
            <tr>
                <td>3교시</td>
                <td></td>
                <td></td>
                <td>프로그래밍</td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td>4교시</td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
        </tbody>
      </table>
    ```
    

# 멀티미디어 태그

## 이미지 태그

이미지 삽입을 위해 사용

```html
<img src="dog.jpg" alt="강아지 사진" width="200" height="100">
<img src="cat.jpg" title="고양이 사진" style="float : right; width : 200px; height : 100px;">
```

- 속성
    - `src` : 이미지 파일 경로
    - `title` : 이미지 제목
    - `width` : 이미지 가로 크기
    - `height` : 이미지 세로 크기
    - `alt` : 이미지 대체 텍스트
    - `style` : 이미지 스타일 정의
    - `border` : 이미지 테두리 두

‌

## 오디오 태그

오디오를 삽입할 때 사용하는 태그

```html
<audio src="audio.mp3" conrols autoplay></audio>
```

- 속성
    - `src` : 오디오 파일의 경로
    - `controls` : 오디오 파일의 재생 제어기 표시
    - `autoplay` : 자동 재생
    - `loop` : 반복 재생
    - `muted` : 초기에 음소거 상태
    - `preload` : 오디오 파일 미리 다운로드

## 비디오 태그

비디오를 삽입할 때 사용하는 태그

```html
<video src="video.mp4" controls width="500" height="400"></video>
```

- 속성
    - `src` : 비디오 파일의 경로
    - `controls` : 비디오 파일의 재생 제어기 표시
    - `autoplay` : 자동 재생
    - `width` : 비디오의 가로크기
    - `height` : 비디오의 세로크기
    - `loop` : 반복 재생
    - `muted` : 초기에 음소거 상태
    - `preload` : 비디오 파일 미리 다운로드
    - `poster` : 비디오의 썸네일

# 공간분할 태그

## 블록 분할 태그

```html
<div style="border: 1px solid black">Block</div>
```

- `<div>` 태그를 이용해 웹 문서의 전체 공간을 block 형식으로 분할함

## 인라인 분할 태그

```html
<span style="background-color: aqua">Inline</span>
```

- `<span>` 태그를 이용해 웹 문서의 한 줄에 대해서 inline 형식으로 분할함

## 아이프레임 태그

```html
<iframe src="basic.html" name="iframe_a" height="500px" width="400" title="Iframe Example"></iframe>
<p><a href="http://www.suanlab.com" target="iframe_a">SuanLab.com</a></p>
```

```html
<span><a href="http://www.suanlab.com" target="if1">SuanLab</a></span> | 
<span><a href="http://www.suanlab.com/youtube.html" target="if1">SuanLab Youtube</a></span><br>
<iframe name="if1" width="700px" height="300px"></iframe>
```

- `<iframe>` 태그를 이용해 웹 문서 내에 다른 웹 문서를 표시할 때 사용
- `src`: 포함할 페이지의 URL 정의
- `width`: 너비
- `height`: 높이
- `title`: 아이프레임 제목
- `name`: 링크 대상 이름
- `scrolling`: 스크롤바

# 입력 양식 태그

## 폼 태그

웹에서 폼을 만드는 데 사용

```html
<form name="이름" action="sign.jsp" method="post">
    <input type="text" name="name1" value="value1">
</form>
```

- 속성
    - `name` : form 이름
    - `action` : 입력 데이터를 처리하는 웹 프로그램(JSP, PHP 등)
    - `method` : 전송 방식
    - `type` : 입력 양식 모양
- `method` 속성: 입력양식의 `method` 속성에는 입력한 데이터의 전송방식(GET/POST) 설정
    - GET 방식
        - URL의 뒷부분에 파라미터를 추가하여 데이터를 전달함
        - URL에 어떤 데이터가 전송되는지 표현되어 있으므로 보안에 취약 (검색 등에 사용)
        - 최대 글자 수: 2048
    - POST 방식
        - HTTP Request 헤더에 파라미터를 추가하여 데이터 전송
        - 어떤 데이터가 전송되는지 표면상에 보이지 않기 때문에 GET 방식보다 보안성이 높음 (로그인 등)
        - 글자 수 제한 없음

## 폼 요소

입력 양식 폼에서 사용되는 다양한 요소

[폼 관련 태그 (1)](https://www.notion.so/982932ab04894fcfa9a5df34c28bfb03)

### `<input>` 태그

```html
<label for="name">이름:</label>
<input type="text" id="name" name="name" value="Suan" size="20">
```

### `<select>` 태그

```html
<select id="food" name="food">
  <option value="pizza" selected>피자</option>
  <option value="hamburger">햄버거</option>
  <option value="pasta">파스타</option>
</select>
```

### `<select>` 태그 (다중 선택)

```html
<select id="food" name="food" multiple>
  <option value="pizza" selected>피자</option>
  <option value="hamburger">햄버거</option>
  <option value="pasta">파스타</option>
</select>

```

### `<select>` 태그 (그룹)

```html
<select id="food" name="food" multiple>
  <optgroup label="음식">
    <option value="pizza" selected>피자</option>
    <option value="hamburger">햄버거</option>
    <option value="pasta">파스타</option>
  </optgroup>
  <optgroup label="후식">
    <option value="cola">콜라</option>
    <option value="coffee"">커피</option>
    <option value="icecream">아이스크림</option>
  </optgroup>
</select>
```

### `<textarea>` 태그

```html
<textarea name="article" rows="20" cols="30">
텍스트 
</textarea>
```

### `<button>` 태그

```html
<button>Button</button>
```

### `<fieldset>`, `<legend>` 태그

```html
<form>
  <fieldset>
    <legend>개인정보</legend>
    <label for="name">이름:</label><br>
    <input type="text" id="name" name="name" value="Suan"><br>
    <label for="affiliation">소속:</label><br>
    <input type="text" id="affiliation" name="affiliation" value="SuanLab"><br><br>
    <input type="submit" value="전송">
  </fieldset>
</form>
```

### `<datalist>` 태그

```html
<form>
  <input list="browsers">
  <datalist id="browsers">
    <option value="Chrome"></option>
    <option value="Firefox"></option>
    <option value="Internet Explorer"></option>
    <option value="Opera"></option>
    <option value="Safari"></option>
  </datalist>
</form>
```

### `<output>` 태그

```html
<form oninput="r.value=parseInt(x.value)*parseInt(y.value)">
  <input type="number" id="x" name="x" value="10">
  *
  <input type="number" id="y" name="y" value="20">
  =
  <output name="r" for="x y"></output>
  <br><br>
  <input type="submit">
</form>
```

## 입력 형식

- `<input>` 태그를 `<form>` ~ `</form>` 내부에서 사용되며, `type` 속성에 데이터 입력 양식 지정
- 주요 공통 속성
    - `readonly` : 읽기 전용
    - `disabled` : 비활성화
    - `autocomplete` : 자동 완성
    - `autofocus` : 웹 페이지 로드시 초기에 포커싱 설정
    - `placeholder` : 입력 폼에 희미하게 설명을 보여줌
    - `required` : 필수 속성
    - `spellcheck` : 오타 점검

### **text** 타입

텍스트 입력에 사용

```html
<input type="text" name="text" size="20">
```

### **password 타입**

비밀번호 사용

```html
<input type="password" name="password" required>
```

### button 타입

버튼 모양에 사용

```html
<input type="button" value="Button">
```

### **radio 타입**

여러 개의 항목 중에서 하나를 선택할 때 사용

```html
<input type="radio" name="gender" value="male">남자
<input type="radio" name="gender" value="female">여자
```

### **checkbox 타입**

여러 개의 항목 중에서 여러개를 선택할 때 사용

```html
<input type="checkbox" name="food" value="pizza">피자<br>
<input type="checkbox" name="food" value="hamburger">햄버거<br>
<input type="checkbox" name="food" value="pasta">파스타<br>
```

### **date 타입**

날짜를 입력할 때 사용

```html
<input type="date" name="date" min="2020-01-01" max="2020-12-31">
```

### **month 타입**

월과 년도를 입력할 때 사용

```html
<input type="month" id="month" name="month">
```

### **week 타입**

주를 입력할 때 사용

```html
<input type="week" id="week" name="week">
```

### **time 타입**

시간을 입력할 때 사용

```html
<input type="time" id="time" name="time">
```

### **datetime-local 타입**

날짜/시간을 입력할 때 사용

```html
<input type="datetime-local" id="datetime" name="datetime">
```

### **color 타입**

색상을 선택할 때 사용

```html
<input type="color" name="color">
```

### **number 타입**

숫자를 입력할 때 사용

```html
<input type="number" name="num" min="0" max="1000">
```

### **range 타입**

범위를 지정할 때 사용

```html
<input type="range" name="point" min="0" max="100">
```

### **email 타입**

email을 입력할 때 사용, 이메일 형식을 자동 체킹

```html
<input type="email" name="email">
```

### **url 타입**

url을 입력할 때 사용, url 형식을 자동 체킹

```html
<input type="url" name="myUrl">
```

### **tel 타입**

전화번호 입력에 사용

```html
<input type="tel" id="phone" name="phone" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}">
```

### **file 타입**

파일 선택에 사용

```html
<input type="file" id="myfile" name="myfile">
```

### **submit과 reset 타입**

입력 양식의 전송과 초기화에 사용

```html
<form>
  <label for="name">이름:</label><br>
  <input type="text" id="name" name="name" value="Suan"><br>
  <label for="affiliation">소속:</label><br>
  <input type="text" id="affiliation" name="affiliation" value="SuanLab"><br><br>
  <input type="submit" value="전송">
  <input type="reset" value="초기화">
</form>
```

### 회원가입 폼 예제

```html
<form name="signUp" action="signUp.jsp" method="post">
  <fieldset width="500px" height="600px">
    <legend>회원가입</legend>
    아이디 : <input type="text" name="id" placeholder="아이디를 입력 해주십시오." required>
    <button type="button" onclick="alert('사용가능한 아이디 입니다!')">아이디 확인</button><br><br>
    비밀번호 : <input type="password" placeholder="8글자 이상 입력 해주십시오." required><br><br>
    생년월일 : <input type="date" name="birthday"><br><br>
    이메일 : <input type="email" name="email" placeholder="이메일을 기입해주십시오." required><br><br>
    전화번호 : <input type="tel" name="tel" placeholder="연락처를 기입해주십시오." required><br><br>
    사이트를 알게된 경로:<br>
    <input type="checkbox" name="a" value="serch">검색
    <input type="checkbox" name="a" value="friend">친구
    <input type="checkbox" name="a" value="recommend">추천
    <input type="checkbox" name="a" value="adv">광고
    <input type="checkbox" name="a" value="ect">기타
  </fieldset>
  <button type="submit">회원가입</button>
  <button type="reset">다시 입력</button>
</form>
```

## class와 id

### class 속성

- 여러 태그들을 하나의 그룹으로 그룹핑
- 태그에 `class="클래스명"` 으로 지정
- `.클래스이름`으로 선택

### id 속성

- 하나의 태그에 고유 `id` 부여
- 태그에 `id="고유id값"` 으로 지정
- `#id값`으로 선택

```html
<p id="paragraph1">첫번째 문단</p>
<p class="content1">컨텐츠 1</p>
<p class="content2">컨텐츠 2</p>
```

# 시맨틱 요소

[시맨틱 관련 태그 (1)](https://www.notion.so/988029e3d02e4e27a8ad8e22d83ea12a)

![HTML%20%E1%84%8C%E1%85%A5%E1%86%BC%E1%84%85%E1%85%B5%203f8832fa1d4e4d01b09e64f5cd5d711a/semantic.png](HTML%20%E1%84%8C%E1%85%A5%E1%86%BC%E1%84%85%E1%85%B5%203f8832fa1d4e4d01b09e64f5cd5d711a/semantic.png)