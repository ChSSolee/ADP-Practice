# 11. 객체 메소드 (Object Method), 계산된 프로퍼티 (Computed Property)

## 객체 메소드 (Object Method)

### `Object.assign()` : 객체 복제

```jsx
const user = {
  name : 'Mike',
  age : 30
}

const newUser = Object.assign({}, user);

newUser.name = 'Tom';
console.log(newUser)
console.log(user);
```

```
// [object Object] 
{
  "name": "Tom",
  "age": 30
}

// [object Object] 
{
  "name": "Mike",
  "age": 30
}
```

- **`Object.assign()`을 통한 속성 추가**

```jsx
const user = {
  name : 'Mike',
  age : 30
}

console.log(Object.assign({gender:'male'}, user))
```

```
// [object Object] 
{
  "gender": "male",
  "name": "Mike",
  "age": 30
}
```

- **`Object.assign()`을 통한 객체 수정 (덮어쓰기)**

```jsx
const user = {
  name : 'Mike',
  age : 30
}

console.log(Object.assign({name:'Tom'}, user))
```

```
// [object Object] 
{
  "name": "Tom",
  "age": 30
}
```

- **`Object.assign()`을 통한 여러 객체 병합**

```jsx
const user = {
  name : 'Mike'
}

const info1 = {
  age : 30
}

const info2 = {
  gender : 'male'
}

console.log(Object.assign(user, info1, info2))
```

```
// [object Object] 
{
  "name": "Mike",
  "age": 30,
  "gender": "male"
}
```

---

### `Object.keys()` : 키 배열 (Array) 반환

```jsx
const user = {
  name : 'Mike',
  age : 30,
  gender : 'male'
}

console.log(Object.keys(user));
```

```
// [object Array] (3)
["name","age","gender"]
```

---

### `Object.values()` : 값 배열 반환

```jsx
const user = {
  name : 'Mike',
  age : 30,
  gender : 'male'
}

console.log(Object.values(user));
```

```
// [object Array] (3)
["Mike",30,"male"]
```

---

### `Object.entries()` : 키/값 배열 반환

```jsx
const user = {
  name : 'Mike',
  age : 30,
  gender : 'male'
}

console.log(Object.entries(user));
```

```
// [object Array] (3)
[// [object Array] (2)
["name","Mike"],// [object Array] (2)
["age",30],// [object Array] (2)
["gender","male"]]
```

---

### `Object.fromEntries()` : 키/값 배열을 객체로

```jsx
const arr = [
  ["name", "Mike"],
  ["age", 30],
  ["gender", "male"]
];

console.log(Object.fromEntries(arr))
```

```
// [object Object] 
{
  "name": "Mike",
  "age": 30,
  "gender": "male"
}
```

---

## 계산된 프로퍼티 (Computed Property)

- **대괄호 안에 변수를 넣어 줌으로서, 문자열이 아닌 값 할당 ⇒ Computed property**

```jsx
let a = 'age';

const user = {
  name : 'Mike',
  [a] : 30 
}
```

- 수식도 삽입도 가능

```jsx
const user = {
  [1 + 4] : 5,
  ["안녕" + "하세요"] : "Hello"
}

console.log(user);
```

```
// [object Object] 
{
  "5": 5,
  "안녕하세요": "Hello"
}
```