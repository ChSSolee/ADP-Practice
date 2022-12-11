# 18. 클로저 (Closure)

## 어휘적 환경 (Lexical Envicronment)

```jsx
function makeAdder(x) {
  return function(y) {
    return x + y;
  }
}

const add3 = makeAdder(3);
console.log(add3(2));
```

(1) : 전역 Lexical 환경 - 최초 실행시

`**makeAdder**` : function

`**add3**` : 초기화 X

(2) : `**makeAdder**` Lexical 환경 - `**const add3**` 실행 시

`**x**` : 3

(3) : 전역 Lexical 환경 - `**function makeAdder(x)**` 실행 시

`**makeAdder**` : function

`**add3**` : function

(4) : 익명함수 Lexical 환경 - `**function makeAdder(x)**` 실행 시

`**y**` : 2

(5) : (3)이 (4)를 참조 ⇒ (2)가 (3)을 참조

## Closure : 함수와 렉시컬 **환경의 조합**

- **함수가 생성될 당시의 외부 변수를 기억**
- **생성 이후에도 계속 접근 가능**

```jsx
function makeAdder(x) {
  return function(y) { //y를 가지고 있고, 상위함수인 makeAdder의 x에 접근 가능
    return x + y;
  }
}

const add3 = makeAdder(3);
console.log(add3(2)); // add3 함수가 생성된 이후에도 상위함수인 makeAdder의 x에 접근 가능

const add10 = makeAdder(10);
console.log(add10(5)); 
console.log(add3(1));
```

- 예)

```jsx
function makeCounter() {
    let num = 0;

    return function() {
        return num++;
    };
}

let counter = makeCounter();

console.log(counter());
console.log(counter());
console.log(counter());
```

```
0

1

2
```