# 10. 생성자 함수 (generator)

### 생성자 함수

- **유사한 객체를 반복 생성할 때 유용**
- 대게 첫 글자는 대문자로
- **`new` 연산자를 사용해서 호출**

```jsx
function Item(title, price) {
  // this = {};
  
  this.title = title;
  this.price = price;
  this.showPrice = function () {
    console.log(`가격은 ${price}.`);
  }
  // return this;
}

const item1 = new Item('인형', 3000);
const item2 = new Item('가방', 4000);
const item3 = new Item('지갑', 5000);

console.log(item1, item2, item3);

item3.showPrice();
```

```
// [object Object] 
{
  "title": "인형",
  "price": 3000,
  "showPrice": "function () {\n    console.log(`가격은 ${price}.`);\n  }"
} // [object Object] 
{
  "title": "가방",
  "price": 4000,
  "showPrice": "function () {\n    console.log(`가격은 ${price}.`);\n  }"
} // [object Object] 
{
  "title": "지갑",
  "price": 5000,
  "showPrice": "function () {\n    console.log(`가격은 ${price}.`);\n  }"
}

"가격은 5000."
```