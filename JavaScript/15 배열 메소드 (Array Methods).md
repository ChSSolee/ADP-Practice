# 15. 배열 메소드 (Array Methods)

## `arr.splice()`

### `arr.splice(n, m)` : n+1번째 원소 부터 m개 삭제

```jsx
let arr = [1,2,3,4,5];
arr.splice(1, 2)
```

```
(2) [2, 3]
```

### `arr.splice(n, m, x)` : 특정 요소 지우고 추가

```jsx
let arr = ["나는", "철수", "입니다"];
arr.splice(1, 0, "대한민국", "소방관");
arr
```

```
(5) ['나는', '대한민국', '소방관', '철수', '입니다']
```

### `arr.splice()` : 삭제된 요소 반환

```jsx
let arr = [1, 2, 3, 4, 5];
let result = arr.splice(1, 2);

console.log(arr);
console.log(result);
```

```
// [object Array] (3)
[1,4,5]

// [object Array] (2)
[2,3]
```

---

### `arr.slice(n, m)` : n부터 m까지 slice

- 괄호안에 아무 것도 입력 안할 시, **배열의 복사 발생**

```jsx
let arr = [1, 2, 3, 4, 5];
console.log(arr.slice(1, 4));

let arr2 = arr.slice();
console.log(arr2);
```

```
// [object Array] (3)
[2,3,4]

// [object Array] (5)
[1,2,3,4,5]
```

---

### `arr.concat(arr2, arr3…)` : 합쳐서 새로운 배열 반환

```jsx
let arr = [1, 2];

console.log(arr.concat([3, 4]));
console.log(arr.concat([3, 4], [5, 6]));
```

```
// [object Array] (4)
[1,2,3,4]

// [object Array] (6)
[1,2,3,4,5,6]
```

---

### `arr.forEach( 함수 )` : 배열 함수 반복 적용

```jsx
let arr = ['Mike', 'Tom', 'Jane'];

arr.forEach((name, index) => {
  console.log(`${index + 1}, ${name}`);
})
```

```
"1, Mike"

"2, Tom"

"3, Jane"
```

```jsx
let arr = [1, 2, 3, 4, 5];

let result = 0;
arr.forEach(num => {
  result = result + num;
});

console.log(result);
```

```
15
```

---

### `arr.indexOf()` / `arr.lastIndexOf()` : 해당 원소의 index값 반환 (없으면 -1 반환)

```jsx
let arr = [1, 2, 3, 4, 5, 1, 2, 3];

console.log(arr.indexOf(3)); // 배열에서 3의 위치 탐색
console.log(arr.indexOf(3, 3)); // 배열의 3+1번째 부터 3을 탐색
console.log(arr.lastIndexOf(3)); // 배열의 끝에서 부터 3의 위치 탐색
```

```
2

7

7
```

### `arr.includes()` : 포함하는지 여부 확인

```jsx
let arr = [1, 2, 3];

console.log(arr.includes(2));
console.log(arr.includes(8));
```

```
true

false
```

### `arr.find( 함수 )` : 조건에 맞는 값 탐색

- **첫 번째 true 값만 반환**하고 끝
- 찾는 값이 없으면 `undefined` 반환

- 배열에서 **첫 번째** 짝수 반환

```jsx
let arr = [1, 2, 3, 4, 5];

const result = arr.find((item) => {
  return item % 2 === 0;
});

console.log(result);
```

```
2
```

- age가 19보다 작은 값 탐색

```jsx
let userList = [
  { name : "Mike", age : 30 },
  { name : "Jane", age : 27 },
  { name : "Tom", age : 10 }
]

const result = userList.find((user) => {
  if(user.age < 19) {
    return true;
  } 
  return false;
});

console.log(result);
```

```
// [object Object] 
{
  "name": "Tom",
  "age": 10
}
```

### `arr.findIndex( 함수 )` : 조건에 맞는 값의 위치 반환

- 찾는 값이 없으면 -1 반환

```jsx
let userList = [
  { name : "Mike", age : 30 },
  { name : "Jane", age : 27 },
  { name : "Tom", age : 10 }
]

const result = userList.findIndex((user) => {
  if(user.age < 19) {
    return true;
  } 
  return false;
});

console.log(result);
```

```
// [object Object] 
{
  "name": "Tom",
  "age": 10
}
```

### `arr.filter( 함수 )` : 조건에 맞는 모든 요소를 배열로 반환

```jsx
let arr = [1, 2, 3, 4, 5];

const result = arr.filter((item) => {
  return item % 2 === 0;
});

console.log(result);
```

```
// [object Array] (2)
[2,4]
```

---

### `arr.map( 함수 )` : 함수를 받아 특정 기능을 시행하고 새로운 배열을 반환

```jsx
let userList = [
  { name : "Mike", age : 30 },
  { name : "Jane", age : 27 },
  { name : "Tom", age : 10 }
];

let newUserList = userList.map((user, index) =>{
  return Object.assign({}, user, {
    id : index + 1,
    isAdult: user.age > 19,
  });
});

console.log(newUserList);
```

```
// [object Array] (3)
[// [object Object] 
{
  "name": "Mike",
  "age": 30,
  "id": 1,
  "isAdult": true
},// [object Object] 
{
  "name": "Jane",
  "age": 27,
  "id": 2,
  "isAdult": true
},// [object Object] 
{
  "name": "Tom",
  "age": 10,
  "id": 3,
  "isAdult": false
}]
```

---

### `arr.join()`

```jsx
let arr = ["안녕", "나는", "철수야"];
let result = arr.join(" ");

console.log(result)
```

```
"안녕 나는 철수야"
```

### `arr.split()`

```jsx
let arr = "Mike, Jane, Tom, Jerry";
let result = arr.split(", ");

console.log(result)
```

```
// [object Array] (4)
["Mike","Jane","Tom","Jerry"]
```

---

### `Array.isArray( 배열 )` : 배열인지 여부 확인

- `typeof` 메소드는 객체와 배열을 모두 객체로 인식
- `Array.isArray()`은 배열인지의 여부를 확인

```jsx
let user = {
  name : "Mike",
  age : 30
};

let userList = ['Mike', 'Tom', 'Jane'];

console.log(typeof user);
console.log(typeof userList);

console.log(Array.isArray(user));
console.log(Array.isArray(userList));
```

```
"object"

"object"

false

true
```

---

### `arr.sort( 함수 )` : 배열 재정렬

- **배열 자체가 변경됨으로 주의**
- 메서드의 인수로 정렬 로직을 담은 함수를 받음
- `arr.sort()`는 배열안의 원소를 문자열로 인식하여 정렬

### `arr.reverse()` : 역순으로 재정렬

```jsx
let arr = [1, 5, 4, 3, 2];
arr.sort();

console.log(arr);

arr.reverse();
console.log(arr);
```

```
let arr = [1, 5, 4, 3, 2];
arr.sort();

console.log(arr);

arr.reverse();
console.log(arr);
```

- `arr.sort()`는 배열안의 원소를 문자열로 인식하여 정렬

```jsx
let arr = [27, 8, 5, 13];
console.log(arr.sort());
```

```
// [object Array] (4)
[13,27,5,8]
```

- 따라서 배열의 값을 정렬할 때는, 함수를 정의해주거나 `**Lodash**` 등의 라이브러리를 사용

```jsx
let arr = [27, 8, 5, 13];

function fn(a, b) {
  console.log(a, b);
  return a-b;
};

console.log(arr.sort(fn));
```

```
8 27

5 8

13 5

13 8

13 27

// [object Array] (4)
[5,8,13,27]
```

### `arr.reduce( 함수, 초기값 )` : 함수 반복 적용

- **설정된 초기값에 함수를 반복하여 적용하는 절차로 진행**

```jsx
let arr = [1, 2, 3, 4, 5];

const result = arr.reduce((prev, cur) => {
  return prev += cur;
}, 0);

console.log(result);
```

```
15
```

- **빈 배열을 초기값으로 설정하고, age가 19이상인 원소들을 초기값에 반복 추가**

```jsx
let userList = [
  { name : "Mike", age : 30 },
  { name : "Tom", age : 10 },
  { name : "Jane", age : 27 },
  { name : "Sue", age : 26 },
  { name : "Harry", age : 42 },
  { name : "Steve", age : 60 },
];

let result = userList.reduce((prev, cur) => {
  if (cur.age > 19) {
    prev.push(cur.name);
  }
  return prev;
}, [])

console.log(result);
```

```
// [object Array] (5)
["Mike","Jane","Sue","Harry","Steve"]
```

```jsx
let userList = [
  { name : "Mike", age : 30 },
  { name : "Tom", age : 10 },
  { name : "Jane", age : 27 },
  { name : "Sue", age : 26 },
  { name : "Harry", age : 42 },
  { name : "Steve", age : 60 },
];

let result = userList.reduce((prev, cur) => {
 return (prev += cur.age);
}, 0)

console.log(result);
```

```
195
```

```jsx
let userList = [
  { name : "Mike", age : 30 },
  { name : "Tom", age : 10 },
  { name : "Jane", age : 27 },
  { name : "Sue", age : 26 },
  { name : "Harry", age : 42 },
  { name : "Steve", age : 60 },
];

let result = userList.reduce((prev, cur) => {
 if (cur.name.length === 3) {
  prev.push(cur.name);
  }
  return prev
}, []);

console.log(result);
```

```
// [object Array] (2)
["Tom","Sue"]
```