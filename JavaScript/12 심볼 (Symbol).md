# 12. 심볼 (Symbol)

## 심볼 (Symbol)

- **유일한 식별자를 생성할 때 사용**
- **유일성 보장**
- 설명 추가 가능

```jsx
const id = Symbol('id');
const id2 = Symbol('id'); 

console.log(id)
console.log(id2)

console.log(id === id2);
console.log(id == id2);
```

```
Symbol(id)

Symbol(id)

false

false
```

---

### `Symbol`을 객체의 키로 사용

- **Object 메소드는 `Symbol`로 이루어진 키/값을 전부 무시
⇒ 데이터의 수정을 방지할 때 사용**

```jsx
const id = Symbol('id');
const user = {
  name : 'Mike',
  age : 30,
  [id] : 'myid'
}

console.log(Object.keys(user));
```

```
// [object Array] (2)
["name","age"]
```

---

### `Symbol.for()` : 전역 심볼

- **하나의 심볼만 보장받을 수 있음**
- 없으면 만들고, 있으면 가져옴
- Symbol 함수는 매번 다른 Symbol 값을 생성하지만, `Symbol.for()`메소드는 하나를 생성한 뒤 키를 통해 같은 Symbol을 공유
- 전역 심볼이 아닌 심볼은 키 값을 생성할 수 없음. (description사용)

### 숨겨진 Symbol Key 보는 법

- **`Object.getOwnPropertySymbols()` 혹은 `Reflect.ownKeys()` 사용**

```jsx
// 타인이 만들어 놓은 객체
const user = {
  name : 'Mike',
  age : 30
};

// 나의 작업
const showName = Symbol('show name');
user[showName] = function() {
  console.log(this.name);
};

user[showName]();

// 사용자가 접속하면 보는 메세지
for (let key in user) {
  console.log(`His ${key} is ${user[key]}.`)
}
```

```
"Mike"
```

```
"His name is Mike."

"His age is 30."
```