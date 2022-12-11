# 22. 클래스 (Class)

## 클래스

- **객체의 속성을 선언하는 부분 + 메소드를 선언하는 부분**
    - **`constructor` : 객체를 만드는 생성자 메서드**

```jsx
class User {

	// User의 속성
  constructor(name, age) {
    this.name = name;
    this.age = age;
  }

	// User의 메소드
  showName() {
    console.log(this.name);
  }
}

const tom = new User("Tom", 19);
console.log(tom)
console.log(tom.name);
console.log(tom.showName());
```

```
// [object Object] 
{
  "name": "Tom",
  "age": 19
}

19

"Tom"
```

### 생성자 함수를 클래스와 동일하게 만들기

```jsx
const User = function (name, age) {
  this.name = name;
  this.age = age;
};

User.prototype.showName = function() {
  console.log(this.name);
};

const mike = new User("Mike", 30);
console.log(mike);
```

```
// [object Object] 
{
  "name": "Tom",
  "age": 19
}
```

### 생성자 함수를 통해 새로운 객체를 만들 때, `new`를 선언하지 않으면 `Undefined`가 표시될 뿐, Error가 표시되지 않음 
⇒ 발생한 `Error`에 대해서 개발자가 인지할 수 없음

### 하지만 `Class`를 통해 새로운 객체를 만들 때, `new`를 선언하지 않으면, `Error`가 표시됨
⇒ 발생한 **`Error`**에 대해서 개발자가 인지할 수 있음

- **Class의 메소드는 for in문으로 탐색 할 수 없음**

```jsx
const User1 = function (name, age) {
  this.name = name;
  this.age = age;
};

User1.prototype.showName = function() {
  console.log(this.name);
};

const mike = new User1("Mike", 30);

for (const p in mike) {
  console.log(p);
}
```

```
"name"
"age"
"showName"
```

```jsx
class User2 {
  constructor(name, age) {
    this.name = name;
    this.age = age;
  }
  showName() {
    console.log(this.name);
  }
}

const tom = new User2("Tom", 19);

for (const p in tom) {
  console.log(p);
}
```

```
"name"
"age"
```

---

## Class 상속 : `extends`

```jsx
class Car {
  constructor(color) {
    this.color = color;
    this.wheels = 4;
  }
  drive() {
    console.log("drive..");
  }
  stop() {
    console.log("stop..");
  }
}

class Bmw extends Car {
  park() {
    console.log("Park");
  }
}

const z4 = new Bmw("blue");

console.log(z4);
console.log(z4.drive());
```

```
// [object Object] 
{
  "color": "blue",
  "wheels": 4
}

"drive.."
```

---

## 메소드 오버라이딩 (method overriding)

- **동일한 이름의 메소드를 덮어쓰기**

```jsx
class Car {
  constructor(color) {
    this.color = color;
    this.wheels = 4;
  }
  drive() {
    console.log("drive..");
  }
  stop() {
    console.log("stop..");
  }
}

class Bmw extends Car {
  park() {
    console.log("Park");
  }
  stop() {
    console.log("Off");
  }
}

const z4 = new Bmw("blue");

console.log(z4.stop());
```

```
"Off"
```

- **부모 클래스의 메소드를 이어서 사용하기 위해서는 `super` 사용 (=메소드 오버라이딩)**

```jsx
class Car {
  constructor(color) {
    this.color = color;
    this.wheels = 4;
  }
  drive() {
    console.log("drive..");
  }
  stop() {
    console.log("stop..");
  }
}

class Bmw extends Car {
  park() {
    console.log("Park");
  }
  stop() {
    super.stop();
    console.log("Off");
  }
}

const z4 = new Bmw("blue");

console.log(z4.stop());
```

```
"stop.."

"Off"
```

---

## Class 오버라이딩

- **항상 자식 클래스에는 super()를 통하여, 부모 클래스의 속성을 상속해야 함**

```jsx
class Car {
  constructor(color) {
    this.color = color;
    this.wheels = 4;
  }
  drive() {
    console.log("drive..");
  }
  stop() {
    console.log("stop..");
  }
}

class Bmw extends Car {
  constructor(color) {
    super(color);
    this.navigation = 1;
  }
  park() {
    console.log("Park");
  }
}

const z4 = new Bmw("blue");

console.log(z4);
```

```
// [object Object] 
{
  "color": "blue",
  "wheels": 4,
  "navigation": 1
}
```