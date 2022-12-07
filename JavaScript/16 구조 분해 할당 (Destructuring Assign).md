# 16. 구조 분해 할당 (Destructuring Assign)

## 배열 구조 분해

```jsx
let users = "Mike-Tom-Jane"
let [user1, user2, user3] = users.split("-");

console.log(user1);
console.log(user2);
console.log(user3);
```

```
"Mike"

"Tom"

"Jane"
```

- **배열 구조 분해 : 기본값**
    - **default값을 할당하면, 값이 undefined 되는 것을 방지**

```jsx
let [a, b, c] = [1, 2];
console.log(c);
```

```
undefined
```

```jsx
let [a, b, c=5] = [1, 2];
console.log(c);
```

```
5
```

- **공백과 쉼표를 이용하여, 일부 반환값 무시 가능**

```jsx
let [user1, , user2] = ['Mike', 'Tom', 'Jane', 'Tony']

console.log(user1);
console.log(user2);
```

```
"Mike"
"Jane"
```

- **배열 구조 분해 : 바꿔치기**
    - **a와 b의 값을 서로 바꿀 때**

```jsx
let a = 1;
let b = 2;

console.log(`a = ${a}
b = ${b}`);

[a, b] = [b, a];

console.log(`a = ${a}
b = ${b}`);
```

```
"a = 1
b = 2"

"a = 2
b = 1"
```

---

## 객체 구조 분해

```jsx
let user = {name : 'Mike', age : 30};

let {name, age} = user;
console.log(name);
console.log(age);

let {name : userName, age : userAge} = user;
console.log(userName);
console.log(userAge);
```

```
"Mike"
30

"Mike"
30
```

### 객체 구조 분해 : 기본값

```jsx
let user = {name : 'Mike', age : 30};

let {name, age, gender='male'} = user;

console.log(name);
console.log(age);
console.log(gender);
```

```
"Mike"

30

"male"
```