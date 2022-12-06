# 08. 배열 (Array)

## 배열 : 순서가 있는 리스트(list)

### `let` `배열명` = `[`’원소1’, ‘원소2’, ‘원소3’ …`]`

- **각 원소는 `index`를 가짐**
- 배열은 문자 뿐만 아니라, 숫자, 객체, 함수 등도 포함

### 배열 생성 & 편집

```jsx
let days = ['mon', 'tue', 'wed'];

console.log(days[0]);
console.log(days[1]);
console.log(days[2]);

days[1] = '화요일'
console.log(days)
```

```
"mon" 

"tue"

"wed"

// [object Array] (3)
["mon","화요일","wed"]
```

### `배열.length` : 배열의 길이

```jsx
let days = ['mon', 'tue', 'wed'];

console.log(days.length)
```

```
3
```

### `배열.push()` : 배열 끝 요소 추가

```jsx
let days = ['mon', 'tue', 'wed'];

days.push('thu');

console.log(days)
```

```
// [object Array] (4)
["mon","tue","wed","thu"]
```

### `배열.pop()` : 배열 끝 요소 제거

```jsx
let days = ['mon', 'tue', 'wed'];

days.pop('wed');

console.log(days)
```

```
// [object Array] (2)
["mon","tue"]
```

### `배열.unshift()` : 배열 앞에 추가

```jsx
let days = ['mon', 'tue', 'wed'];

days.unshift();

console.log(days)
```

```
// [object Array] (4)
["sun","mon","tue","wed"]
```

### `배열.shift()` : 배열 앞에 제거

```jsx
let days = ['mon', 'tue', 'wed'];

days.shift();

console.log(days)
```

```
// [object Array] (2)
["tue","wed"]
```

### 반복문 (for)과 활용

```jsx
let days = ['mon', 'tue', 'wed'];

for(let index=0; index < days.length; index++) {
  console.log(days[index]);
}
```

```
"mon"

"tue"

"wed"
```

### 반복문 (for … of)과 활용

```jsx
let days = ['mon', 'tue', 'wed'];

for (let day of days) {
  console.log(day);
}
```

```
"mon"

"tue"

"wed"
```