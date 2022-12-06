# 07. 객체 (Object)

## 객체 : key와 value로 구성

---

### 객체 생성

### `const 객체명 = {`

### `key : ‘value’`

### `}`

```jsx
const superman = {
  name : 'clark',
  age : 30,
}
```

---

### 객체에 접근

### `객체명.key`

### `객체명[’key’]`

```jsx
console.log(superman)
console.log(superman.name)
console.log(superman['age'])
```

```
// [object Object] 
{
  "name": "clark",
  "age": 30
}

"clark"

30
```

---

### 객체에 추가

### `객체명.key = ‘object’;`

### `객체명[’key’] = ‘object’;`

```jsx
superman.hairColor = 'black';
superman['hobby'] = 'football';

console.log(superman)
```

```
// [object Object] 
{
  "name": "clark",
  "age": 30,
  "hairColor": "black",
  "hobby": "football"
}
```

---

### **객체에 삭제**

### `delete 객체명.key;`

```jsx
delete superman.age
delete superman['hairColor']

console.log(superman)
```

```
// [object Object]{  "name": "clark",  "hobby": "football"}
```

---

### 객체 생성 함수

```jsx
function makeObject(name, age) {
  return {
    name,
    age,
    hobby : 'football'
  }
}

const Mike = makeObject('Mike', 30);
console.log(Mike)
```

```
// [object Object] 
{
  "name": "Mike",
  "age": 30,
  "hobby": "football"
}
```

---

### 객체 속성(property) 존재 여부 확인

```jsx
function makeObject(name, age) {
  return {
    name,
    age,
    hobby : 'football'
  }
}

const Mike = makeObject('Mike', 30);

console.log('age' in Mike);
console.log('birthday' in Mike);
```

```
true 

false
```

- **age속성이 없거나, age가 20 미만이면 false**

```jsx
function isAdult(user) {
  if(!('age' in user) || user.age < 20) {
    return false;
  } 
  return true;
}

const Mike = {
  name : 'Mike',
  age : 30
};

const Jane = {
  name : 'Jane'
};

console.log(isAdult(Mike))
console.log(isAdult(Jane))
```

```
true 

false
```

---

```jsx
const Mike = {
  name : 'Mike',
  age : 30
}

for(x in Mike){
  console.log(x)
}
```

```
"name" 

"age"
```

- **********************************************************************************반복문을 통해 객체 속성 출력**********************************************************************************

```jsx
const Mike = {
  name : 'Mike',
  age : 30
}

for(x in Mike){
  console.log(Mike[x])
}
```

```
"Mike" 

30
```

---

## Method : 객체 속성으로 할당 된 함수

### `this` : 객체의 이름을 의미하는 변수

```jsx
const user = {
  name : 'Mike',
  sayHello : function(){
    console.log(`Hello, I'm ${this.name}`);
  }
}

user.sayHello();
```

```
"Hello, I'm Mike"
```

- **화살표 함수는 일반 함수와는 달리 자신만의 `this`를 가지지 않음**
- **화살표 함수 내부에서 this를 사용하면, 그 `this`는 외부에서 값을 가져옴
(브라우저 환경의 전역객체 : `window`, 
 Node js 환경의 전역객체 : `global`)**

```jsx
let boy = {
  name : 'Mike',
  sayHello : () => {
    console.log(this); // 전역객체
  }
}

boy.sayHello();
// this != boy
```

```
/* Log Skipped: Sorry, this log cannot be shown. You might need to use the browser console instead. */
```

```jsx
let boy = {
  name : 'Mike',
  showName: function () {
    console.log(boy.name)
  }
};

boy.showName();
```

```
"Mike"
```

```jsx
let boy = {
  name : 'Mike',
  showName: function () {
    console.log(boy.name)
  }
};

let man = boy;
man.name = "Tom"

console.log(boy.name)
```

```
"Tom"
```

```jsx
let boy = {
  name : 'Mike',
  showName: function () {
    console.log(boy.name)
  }
};

let man = boy;
man.showName();
```

```
"Mike"
```

- **boy ⇒ null ⇒ boy의 속성이 전부 사라짐**

```jsx
let boy = {
  name : 'Mike',
  showName: function () {
    console.log(boy.name)
  }
};

let man = boy;
boy = null;

man.showName();
```

```
Uncaught TypeError: Cannot read properties of null (reading 'name') 
 at https://cdpn.io/cpe/boomboom/pen.js?key=pen.js-73741128-4dba-b782-b402-4ce96da5afa9:4
```

- **⇒ `this`로 변경**

```jsx
let boy = {
  name : 'Mike',
  showName: function () {
    console.log(this.name)
  }
};

let man = boy;
boy = null;

man.showName();
```

```
"Mike"
```

### 화살표 함수

- **`Method`를 사용할 때 `this`를 사용한다면, 화살표 함수 사용 지양**

### 예)

- **객체 자체를 반환**

```jsx
let boy = {
  name : 'Mike',
  sayThis: function () {
    console.log(this)
  }
};

boy.sayThis();
```

```
// [object Object] 
{
  "name": "Mike",
  "sayThis": "function () {\n    console.log(this);\n  }"
}
```

- **위를 화살표 함수로 바꿔주면 
⇒ 화살표 내부 함수의 `this`는 `window` 환경의 전역변수를 가리키기에 오류**

```jsx
let boy = {
  name : 'Mike',
  sayThis: () => {
    console.log(this)
  }
};

boy.sayThis();
```

```
/* Log Skipped: Sorry, this log cannot be shown. You might need to use the browser console instead. */
```