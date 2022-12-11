# 19. setTimeout / setInterval

## `setTimeout( 함수, 시간, 인수 )` : 일정 시간이 지난 후 함수를 실행

- **3초 후에 함수 실행**

```jsx
function showName(name) {
  console.log(name);
}

setTimeout(showName, 3000, "Mike");
```

```
"Mike"
```

## `clearTimeout(tId)` : 예정된 작업 제거

- `**setTimeout()**`은 `**tId**`를 반환
⇒ `**clearTimeout(tId)**`는 `**tId**`를 제거

```jsx
const tId = function showName(name) {
  console.log(name);
}

setTimeout(showName, 3000, 'Mike');

clearTimeout(tId);
```

```
Uncaught ReferenceError: showName is not defined 
 at https://cdpn.io/cpe/boomboom/pen.js?key=pen.js-3aa4e0c5-6057-8674-bdcd-57de04d0d32b:5
```

## `setInterval` : 일정 시간 간격으로 함수를 반복

- 중단하려면 `**clearTimeout(tId)` 실행**

- **3초 간격으로 함수 실행**

```jsx
function showName(name) {
  console.log(name);
}

const tId = setInterval(showName, 3000, 'Mike');
```

```
"Mike"

"Mike"

"Mike"

.
.
.

```

- 예)

```jsx
let num = 0;

function showTime() {
  console.log(`접속한지 ${num++}초`);
  if (num > 5) {
    clearInterval(tId);
  }
}

const tId = setInterval(showTime, 1000);
```

```
"접속한지 0초"
"접속한지 1초"
"접속한지 2초"
"접속한지 3초"
"접속한지 4초"
"접속한지 5초"
```