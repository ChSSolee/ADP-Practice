# 24. 제너레이터 (Generator)

## Generator : 함수의 실행을 중간에 멈췄다가 재개할 수 있는 기능

- **다른 작업을 하다가 다시 돌아와서, `next()`를 사용하면, 진행이 멈춘 부분부터 이이서 실행**
- **iterable**
    - `**Symbol.iterator` 메서드가 존재**
    - `**Symbol.iterator`는 iterator을 반환**
- **iterator**
    - `**next` 메서드를 가짐**
    - `**next` 메서드는 `value`와 `done`속성을 가진 객체를 반환**
    - **작업이 끝나면 done은 true가 됨**

---

## `next()`

- **가장 가까운 yield문을 만날 때 까지 실행**
    - 반환된 데이터 객체는 `**value**`와 `**done**` 속성을 가지며
    제너레이터의 실행이 완료되면 true / 아니면 false

```jsx
function* fn() {
  console.log(1);
  yield 1;
  console.log(2);
  yield 2;
  console.log(3);
  console.log(4);
  yield 3;
  return "finish";
}

const a = fn();

console.log(a.next());
console.log(a.next());
console.log(a.next());
console.log(a.next());
console.log(a.next());
```

```
1
// [object Object] 
{
  "value": 1,
  "done": false
}
```

```
2
// [object Object] 
{
  "value": 2,
  "done": false
}
```

```
3
4
// [object Object] 
{
  "value": 3,
  "done": false
}
```

```
// [object Object] 
{
  "value": "finish",
  "done": true
}
```

```
// [object Object] 
{ 
	"value": undefined,
  "done": true
}
```

---

## `return()`

```jsx
function* fn() {
  console.log(1);
  yield 1;
  console.log(2);
  yield 2;
  console.log(3);
  console.log(4);
  yield 3;
  return "finish";
}

const a = fn();

console.log(a.return("END"));
console.log(a.next());
```

```
// [object Object]{  "value": "END",  "done": true}
```

```
// [object Object]{  "value": undefined, "done": true}
```

## `throw()`

```jsx
function* fn() {
  try {
  console.log(1);
  yield 1;
  console.log(2);
  yield 2;
  console.log(3);
  console.log(4);
  yield 3;
  return "finish";
  } catch (e) {
    console.log(e);
  }
}

const a = fn();

console.log(a.next());
console.log(a.throw(new Error('err')));
console.log(a.next());
```

```
1
// [object Object]{  "value": 1,  "done": false}
```

```
// [object Object]{  "value": undefined, "done": true}
```

```
// [object Object]{  "value": undefined, "done": true}
```

---

## `Symbol.iterator()`

```jsx
function* fn(){
  yield 4;
  yield 5;
  yield 6;
}

const a = fn();

console.log(a[Symbol.iterator]() === a)

for (let num of a) {
  console.log(num);
}
```

```
true

4

5

6
```

```jsx
const str = 'hello';

const xx = str[Symbol.iterator]()

for(let s of xx){
  console.log(s);
}
```

```
"h"

"e"

"l"

"l"

"o"
```

---

## `next()`에 인수 전달

```jsx
function* fn() {
  const num1 = yield "첫 번째 숫자를 입력";
  console.log(num1);
  
  const num2 = yield "두 번째 숫자 입력"
  console.log(num2);
  
  return num1 + num2;
}

const a = fn();

console.log(a.next());
console.log(a.next(2));
console.log(a.next(4));
```

```
// [object Object] { "value": "첫 번째 숫자를 입력", "done": false
}
```

```
2

// [object Object]{  "value": "두 번째 숫자 입력",  "done": false}
```

```
4

// [object Object] {  "value": 6,  "done": true  }
```

---

## Generator은 값을 미리 만들어 두지 않음

```jsx
function* fn() {
  let index = 0;
  while (true) {
    yield index++;
  }
}

const a = fn();

console.log(a.next())
console.log(a.next())
console.log(a.next())
```

```
// [object Object] 
{
  "value": 0,
  "done": false
}
```

```
// [object Object] 
{
  "value": 1,
  "done": false
}
```

```
// [object Object] 
{
  "value": 2,
  "done": false
}
```

---

## `yield*` 를 이용

```jsx
function* gen1() {
  yield "w";
  yield "o";
  yield "r";
  yield "l";
  yield "d";
}

function* gen2() {
  yield "Hello, ";
  yield* gen1();
  yield "!";
}

console.log(...gen2());
```

```
"Hello, " "w" "o" "r" "l" "d" "!"
```