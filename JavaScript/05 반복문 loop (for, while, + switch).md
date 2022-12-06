# 05. 반복문 loop (for, while, + switch)

## for 문

- **`명확한 반복 횟수가 주어졌을 때`**
- **for (초기값, 조건, 코드 실행 후 작업)**

`for (let i = 0; i < 10; i++) {`

`//반복할 코드`

`}`

```jsx
for(let i = 0; i < 10; i++) {
  console.log(i)
}
```

```
0 

1 

2 

3  

4  

5 

6

7 

8  

9
```

## while 문

- **`명확한 반복 횟수가 주어지지 않았을 때`**

`let i = 0;`

`while(i < 10){`

`//코드`

`}`

```jsx
let i = 0;

while(i < 10){
  console.log(i);
  i++;
}
```

```
0 

1 

2 

3  

4  

5 

6

7 

8  

9
```

## `break` : 멈추고 빠져나옴

## `continue` : 멈추고 다음 반복문으로

- **‘`취소`’가 나올 때 까지 `confirm`**

```jsx
while(true) {
  let answer = confirm('계속 할까요?');
  if(!answer){
    break;
  }
}
```

- **10보다 작은 짝수 출력**

```jsx
for(let i = 0; i < 10; i++){
  if(i%2){
    continue;
  }
  console.log(i)
}
```

```
0 

2

4 

6

8
```

---

## switch

- **`break`를 만나기 전 까지 모든 경우 실행**

`switch(평가) {`

`case A:`

`// A 일때 코드`

`case B:`

`// B일 때 코드`

`…`

`}`

```jsx
let fruit = prompt('무슨 과일을 사고 싶나요?');

switch(fruit){
  case '사과':
    console.log(fruit + ': 100원');
    break;
  case '바나나':
    console.log(fruit + ': 200원');
    break;
  case '키위':
    console.log(fruit + ': 300원');
    break;
  case '멜론':
    console.log(fruit + ': 400원');
    break;
  case '수박':
    console.log(fruit + ': 500원');
    break;
	default:
		console.log('그런 과일은 없습니다.')
}
```