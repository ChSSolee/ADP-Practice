# 20. call, apply, bind

## `call`, `apply`, `bind` : 함수 호출 방식과 관계없이 this를 지정 가능

---

## `call` : 모든 함수에서 사용 가능, this를 특정값으로 지정 가능

- `**call`의 첫 번째 매개변수** : `**call**`을 적용할 함수
**이외의 매개변수** : `**call**`을 적용할 함수의 매개변수

```jsx
const mike = {
  name: "Mike",
};

const tom = {
  name: "Tom",
};

function showThisName() {
  console.log(this.name);
}

showThisName(); // 아무것도 실행 안됨
showThisName.call(mike);
```

```
"Mike"

"Tom"
```

```jsx
const mike = {
  name: "Mike",
};

const tom = {
  name: "Tom",
};

function showThisName() {
  console.log(this.name);
}

function update(birthYear, occupation){
  this.birthYear = birthYear;
  this.occupation = occupation;
};

update.call(mike, 1999, 'sing')

console.log(mike);
```

```
// [object Object] 
{
  "name": "Mike",
  "birthYear": 1999,
  "occupation": "sing"
}
```

---

## apply

- `**apply`는 함수 매개변수의 처리하는 방법을 제외하면 `call`과 동일**
- `**call`은 일반적인 함수와 마찬가지로 매개변수를 직접 받지만, `apply`는 배열로 입력 받음**
- **`apply`는 배열 요소를 함수 매개변수로 사용할 때, 유용**

```jsx
update.apply(mike, [1999, 'sing']);
console.log(mike);
```

```
// [object Object] 
{
  "name": "Mike",
  "birthYear": 1999,
  "occupation": "sing"
}
```

```jsx
const nums = [3, 10, 1, 6, 4];

const minNum1 = Math.min.apply(null, nums);
const minNum2 = Math.min.call(null, ...nums);

console.log(minNum1);
console.log(minNum2);
```

```
1

1
```

---

## `bind` : 함수의 this값을 영구적으로 변경

```jsx
const mike = {
  name: "Mike",
};

function update(birthYear, occupation) {
  this.birthYear = birthYear;
  this.occupation = occupation;
}

const updateMike = update.bind(mike);

updateMike(1980, 'police');
console.log(mike);
```

```
// [object Object] 
{
  "name": "Mike",
  "birthYear": 1980,
  "occupation": "police"
}
```

---

- 예)

```jsx
const user = {
  name: "Mike",
  showName: function() {
    console.log(`hello, ${this.name}`);
  },
};

user.showName();

let fn = user.showName;

fn.call(user);
fn.apply(user);

let boundFn = fn.bind(user);

boundFn();
```

```
"hello, Mike"

"hello, Mike"

"hello, Mike"

"hello, Mike"
```