# 06. 함수 표현식, 화살표 함수 (arrow function)

## 함수 선언문

- **어디서든 호출 가능 (호이스팅 : hoisting)**
- 한번에 한 작업에 집중
- 읽기 쉽고 어떤 동작인지 알 수 있게 작명

### **`function 함수명(매개변수) {`**

### `return`

### **`}`**

- **매개변수 없는 함수**

```jsx
function showError() {
  alert('에러 발생')
}

showError();
```

- **매개변수 있는 함수**

```jsx
function sayHello(name) {
  const msg = `Hello, ${name}`;
  console.log(msg);
}

sayHello('Mike');
```

```
"Hello, Mike"
```

```jsx
function sayHello(name){
  let msg = 'Hello, ';
  if(name){
    msg = `Hello, ${name}`;
  }
  console.log(msg);
}

sayHello()
sayHello('Mike')
console.log(msg)
// msg는 지역변수
```

```
"Hello, "
```

```
"Hello, Mike"
```

```
Uncaught ReferenceError: msg is not defined
 at https://cdpn.io/cpe/boomboom/pen.js?key=pen.js-8b68e0fd-64cd-402f-5143-e454b5e55487:11
```

- **`return`**

```jsx
function add(num1, num2){
  return num1 + num2;
}

console.log(add(1, 2))

const result = add(1, 2)
console.log(result)
```

```
3

3
```

### 전역변수와 지역변수

```jsx
let msg = 'Hello';
console.log('함수 호출 전')
console.log(msg)

function sayHello(name){
  if(name){
    msg += `, ${name}`;
  }
  console.log('함수 호출 후')
  console.log(msg);
}

sayHello();
sayHello('Mike');
```

```
"함수 호출 전" 

"Hello" 

"함수 호출 후"

"Hello"

"함수 호출 후"

"Hello, Mike"
```

```jsx
let msg = 'welcome';
console.log(msg)

function sayHello(name){
  let msg = 'Hello'
  console.log(msg + ' ' + name);
}

sayHello('Mike');
console.log(msg)
```

```
"welcome" 

"Hello Mike"

"welcome"
```

```jsx
let name = "Mike";

function sayHeollo(name) {
  console.log(name)
}

sayHello();
sayHello('Jane');
```

```
"welcome"
```

```
Uncaught ReferenceError: sayHello is not defined
 at https://cdpn.io/cpe/boomboom/pen.js?key=pen.js-62e1f63e-a430-ede9-d1c8-ed4eb0254347:7
```

```jsx
function sayHello(name = 'friend'){
  let msg = `Hello, ${name}`
  console.log(msg)
}

sayHello();
sayHello('Jane');
```

```
"Hello, friend"
 
"Hello, Jane"
```

---

## 함수 표현식

- **코드에 도달하면 생성 (생성 이후에만 사용 가능)**

### **`let 함수명 = function(매개변수){`**

### `**return**`

### **`}`**

- **함수 표현식**

```jsx
let showError = function(){
  console.log('error');
}

showError();
```

```
"error"
```

- **함수 선언문**

```jsx
showError();

function showError() {
  console.log('error');
}
```

```
"error"
```