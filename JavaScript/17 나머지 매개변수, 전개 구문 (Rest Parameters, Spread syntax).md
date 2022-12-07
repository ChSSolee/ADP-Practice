# 17. 나머지 매개변수, 전개 구문 (Rest Parameters, Spread syntax)

## 함수의 인수전달

- JavaScript에서 함수에 전달하는 인수의 개수는 제약이 없음
- **함수 생성시 인수 개수를 지정하여도, 그 인수의 개수보다 많이 입력하여도 에러 발생 X**

---

## arguments

- 함수로 넘어온 모든 인수에 접근
- 함수내에서 이용 가능한 지역 변수
- length / index의 속성을 가짐
- **Array 형태의 객체** => (length / index의 속성을 가짐)
- 배열의 내장 메서드 없음 (forEach, map)

```jsx
function showName(name) {
  console.log(arguments.length);
  console.log(arguments[0]);
  console.log(arguments[1]);
}

console.log(showName('Mike', 'Tom'));
```

```
2

"Mike"

"Tom"
```

---

### 나머지 매개변수 (Rest parameters)

- **인수를 배열로 받을 수 있음**

```jsx
function add(...numbers) {
  let result = 0;
  numbers.forEach((num) => (result += num));
	// let result = numbers.reduce((prev, cur) => prev += num);
  console.log(result);
}

add(1, 2, 3);
add(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
```

```
6

55
```

- **user 객체를 만들어 주는 생성자 함수**

```jsx
function User(name, age, ...skill) {
  this.name = name;
  this.age = age;
  this.skill = skill;
}

const user1 = new User('Mike', 30, 'hrml', 'css');
const user2 = new User('Tom', 30, 'R', 'SQL');
const user3 = new User('Tom', 30, 'Python');

console.log(user1);
console.log(user2);
console.log(user3);
```

```
// [object Object] 
{
  "name": "Mike",
  "age": 30,
  "skill": [
    "hrml",
    "css"
  ]
}

// [object Object] 
{
  "name": "Tom",
  "age": 30,
  "skill": [
    "R",
    "SQL"
  ]
}

// [object Object] 
{
  "name": "Tom",
  "age": 30,
  "skill": [
    "Python"
  ]
}
```

---

## 전개 구문 (Spread syntax)

### 전개 구문 : 배열

```jsx
let arr1 = [1, 2, 3];
let arr2 = [4, 5, 6];

let result = [0, ...arr1, ...arr2, 7, 8, 9];
console.log(result);
```

```
// [object Array] (10)
[0,1,2,3,4,5,6,7,8,9]
```

### 전개 구문 : 복제

- 배열 복제

```jsx
let arr1 = [1, 2, 3];
let arr2 = [4, 5, 6];

let result = [0, ...arr1, ...arr2, 7, 8, 9];
console.log(result);
```

```
// [object Array] (10)
[0,1,2,3,4,5,6,7,8,9]
```

### 전개 구문 : 객체

- 객체 복제

```jsx
let user = {name: 'Mike', age: 30};
let user2 = {...user};

user2.name = "Tom";

console.log(user.name);
console.log(user2.name);
```

```
"Mike"
"Tom"
```

---

### 전개 구문 활용

- **arr1을 [4, 5, 6, 1, 2, 3]으로**
    - 전개 구문 미사용 시
    
    ```jsx
    let arr1 = [1, 2, 3];
    let arr2 = [4, 5, 6];
    
    arr2.reverse().forEach(num => {
      arr1.unshift(num)
    });
    
    console.log(arr1);
    ```
    
    - 전개 구문 사용 시
    
    ```jsx
    let arr1 = [1, 2, 3];
    let arr2 = [4, 5, 6];
    
    arr1 = [...arr2, ...arr1];
    console.log(arr1)
    ```
    

- 객체 생성 시
    - 전개 구문 미사용 시
    
    ```jsx
    let user = { name: 'Mike'};
    let info = { age: 30};
    let fe = ["JS", "React"];
    let lang = ["Korean", "English"];
    
    user = Object.assign({}, user, info, {
      skills : [],
    });
    
    fe.forEach(item => {
      user.skills.push(item);
    });
    
    lang.forEach(item => {
      user.skills.push(item);
    });
    
    console.log(user);
    ```
    
    - 전개 구문 사용 시
    
    ```jsx
    let user = { name: 'Mike'};
    let info = { age: 30};
    let fe = ["JS", "React"];
    let lang = ["Korean", "English"];
    
    user = {
      ...user,
      ...info,
      skils: [...fe, ...lang]
    };
    
    console.log(user);
    ```
    
    ```
    // [object Object] 
    {
      "name": "Mike",
      "age": 30,
      "skils": [
        "JS",
        "React",
        "Korean",
        "English"
      ]
    }
    ```