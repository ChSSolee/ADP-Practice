# 13. 숫자, 수학 method (Number, Math)

## `toString()` : 문자열을 숫자로 변환

```jsx
let num = 10;
console.log(num.toString()); // 10진수 변환

console.log(num.toString(2)); // 2진수 변환

let num2 = 255;
console.log(num2.toString(16)); // 16진수 변환
```

```
"10"

"1010"

"ff"
```

---

## Math

### `Math.PI()` : 원주율

```jsx
console.log(Math.PI);
```

```
3.141592653589793
```

---

### `Math.ceil()` : 올림

### `Math.floor()` : 내림

### `Math.round()` : 반올림

```jsx
let num1 = 5.1;

console.log(Math.ceil(num1));
console.log(Math.floor(num1));
console.log(Math.round(num1));
```

```
6

5

5
```

---

### `toFixed()` : 소수점 자릿수

```jsx
let userRate = 30.1234;

console.log(Math.round(userRate * 100) / 100);
console.log(userRate.toFixed(2));
```

```
30.12

"30.12"
```

---

### `isNaN()` : 결측값 여부 확인

```jsx
let x = Number('x')

console.log(x == NaN)
console.log(x === NaN)
console.log(NaN == NaN)

console.log(isNaN(x))
console.log(isNaN(3))
```

```
false

false

false

true

false
```

---

### `parseInt()` : 문자를 정수로 변환

- **단, 읽을 수 있는 범위에 한함**

```jsx
let margin = '10px';

console.log(parseInt(margin));
```

```
10
```

- 16진수 변환

```jsx
let redColor = 'f3';
console.log(parseInt(redColor));
console.log(parseInt(redColor, 16));
```

```
NaN

243
```

---

### `parseFloat()` : 문자를 실수로 변환

```jsx
let padding = '18.5%'

console.log(parseInt(padding));
console.log(parseFloat(padding));
```

```
18

18.5
```

---

### `Math.random()` : 0 ~ 1 사이 난수 생성

- 1 ~ 100 사이 난수 생성

```jsx
console.log(Math.floor(Math.random() * 100) + 1)
```

---

### `Math.max()` / `Math.min()` : 최대 / 최소 값

```jsx
console.log(Math.max(1, 4, -1, 5, 10, 9, 5.54));
console.log(Math.min(1, 4, -1, 5, 10, 9, 5.54));
```

```
10

-1
```

---

### `Math.abs()` : 절댓값

```jsx
console.log(Math.abs(-1))
```

```
1
```

---

### `Math.pow(n, m)` : n의 m 제곱

```jsx
console.log(Math.pow(2, 4))
```

```
16
```

---

### `Math.sqrt()` : 제곱근

```jsx
console.log(Math.sqrt(16))
```

```
4
```