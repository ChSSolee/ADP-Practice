# 14. 문자열 메소드 (String Methods)

### backtick : ` `

- 여러줄 포함 가능

```jsx
let desc1 = `오늘은 맑고 화창한
날씨가 계속 되겠습니다.`

let desc2 = '오늘은 맑고 화창한 \n날씨가 계속 되겠습니다.'

console.log(desc1);
console.log(desc2);
```

```
"오늘은 맑고 화창한
날씨가 계속 되겠습니다."

"오늘은 맑고 화창한
날씨가 계속 되겠습니다."
```

---

### `length` : 문자열의 길이

```jsx
let desc = 'string';
console.log(desc.length)
```

```
6
```

### 특정 위치에 접근

- **접근만 가능, 수정은 불가**

```jsx
let desc = 'string';
console.log(desc[0])

desc[0] = 'a'
console.log(desc[0])
```

```
"s"

"s"
```

### `toUppercase()` / `toLowerCase()` : 영문 대/소문자 변환

```jsx
let desc = 'STRing';

console.log(desc.toLowerCase());
console.log(desc.toUpperCase());
```

```
"string"

"STRING"
```

### `indexOf()` : 문자열의 위치 반환

- **포함되지 않은 문자열 입력시 ⇒ -1 반환**

```jsx
let desc = 'STRing';

console.log(desc.indexOf('ing'));
console.log(desc.indexOf('axa'));
```

```
3

-1
```

- `**indexOf`를 활용한 조건문**

```jsx
let desc = 'STRing';

if (desc.indexOf('STR') > -1) {
  console.log('STR이 포함된 문장')
}
```

```
"STR이 포함된 문장"
```

### `includes()` : 문자열 포함시 true 반환, 없으면 false

```jsx
// 금지어 : 콜라
function hasCola(str) {
  if(str.includes('콜라')) {
    console.log('금지어 포함');
  } else {
    console.log('금지어 미포함');
  }
}

console.log(hasCola('콜라'))
console.log(hasCola('사이다'))
```

```
"금지어 포함"

"금지어 미포함"
```

### `slice(n, m)` : 문자열 슬라이싱

- **m이 없으면 문자열 끝까지**
- **양수면, 그 숫자까지 (포함하지 않음)**
- **음수면 끝에서 부터 n까지**

```jsx
let desc = 'abcdefg';

console.log(desc.slice(2))
console.log(desc.slice(0, 5))
console.log(desc.slice(2, -2))
```

```
"cdefg"

"abcde"

"cde"
```

### `substring(n, m)` : **n과 m사이 문자열 반환**

- **n과 m을 바꿔도 동작**
- **음수는 0으로 인식**

```jsx
let desc = 'abcdefg';

console.log(desc.substring(2, 5));
console.log(desc.substring(5, 2));
```

```
"cde"

"cde"
```

### `substr(n, m)` : n부터 시작하여, m개를 가져옴

```jsx
let desc = 'abcdefg';

console.log(desc.substr(2, 4));
console.log(desc.substr(-4, 2));
```

```
"cdef"

"de"
```

### `trim()` : 앞 뒤 공백 제거

```jsx
let desc = "  coding    ";

console.log(desc.trim())
```

```
"coding"
```

### `repeat(n)` : n번 반복

```jsx
let hello = "hello";

console.log(hello.repeat(3));
```

```
"hellohellohello"
```

---

## 문자열 비교

### ASCII코드표에 기반하여 문자열 비교

```jsx
console.log(1 < 3);
console.log("a" < "c");
```

```
true

true
```

### `codePointAt()` : 문자에 해당하는 숫자 반환

### `String.**fromCodePoint()` : 숫자에 해당하는 문자 반환**

```jsx
console.log("a".codePointAt(0));
console.log(String.fromCodePoint(97));
```

```
97

"a"
```

---

- **활용1**

```jsx
let list = [
  "01. 들어가며",
  "02. JS의 역사",
  "03. 자료형",
  "04. 함수",
  "05. 배열"
];

let newList = [];

for (let i=0; i < list.length; i++){
  newList.push(list[i].slice(4));
}

console.log(newList);
```

```
// [object Array] (5)
["들어가며","JS의 역사","자료형","함수","배열"]
```

- **금지어 탐색**

```jsx
// 금지어 : 콜라
function hasCola(str) {
  if(str.indexOf('콜라') > -1) {
    console.log('금지어 포함');
  } else {
    console.log('금지어 미포함');
  }
}

console.log(hasCola('콜라'))
console.log(hasCola('사이다'))
```

```
"금지어 포함"

"금지어 미포함"
```