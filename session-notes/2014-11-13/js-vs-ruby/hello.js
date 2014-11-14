// 1. JavaScript has no classes, but it has objects.
// 2. In JavaScript, functions are first-order values.
// 3. The way variable scoping works is very different.
//    In particular, variables are global unless you
//    indicate otherwise (this is a slight lie).

var max = function(x, y) {
  if (x < y) {
    return y;
  } else {
    return x;
  }
}

console.log(max(5,4) == 5);
console.log(max(0,10) == 10);

var numbers = [10, 20, 30, 40];

// for(var i = 0;i < numbers.length;i++) {
//   console.log("numbers[" + i + "] == " + numbers[i]);
// }

var forEach = function(array, callback) {
  for(var i = 0;i < array.length;i++) {
    callback(array[i]);
  }
}

forEach(numbers, function(number) {
  console.log(number);
});

jQuery.get("http://coolsite.biz/users.json", function(data) {
  console.log("Got data!");
  console.log(data);
});
