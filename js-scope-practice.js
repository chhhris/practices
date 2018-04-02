function logIt1(){
    var text = 'outside';
};

function logIt2(){
    var text = 'outside';
    console.log(text);
};
logIt1();
logIt2();

let y = 1;
if (y === 1) {
  var x = 2;

  console.log(x);
  // expected output: 2
}

console.log(x);
// expected output: 1




function varTest() {
  var x = 1;
  if (true) {
    var x = 2;  // same variable!
    console.log(x);  // 2
  }
  console.log(x);  // 2
}

function letTest() {
  let x = 1;
  if (true) {
    let x = 2;  // different variable
    console.log(x);  // 2
  }
  console.log(x);  // 1
}




var x = 'global';
let y = 'global';
console.log(this.x); // "global"
console.log(this.y); // undefined