var ary = [1, 7, 3, 4];
// getProductsOfAllIntsExceptAtIndex(ary)
// => [84, 12, 28, 21]

function getProductsOfAllIntsExceptAtIndex(ary) {
  const newArray = [];

  for (i = 0; i < ary.length; i++ ) {
    console.log("index i: " + i);
    console.log("ary length: " + ary.length);

    var subArray = ary.slice(0);
    subArray.splice(i, 1);

    var total = 1;
    for (el = 0; el < subArray.length; el++) {
      console.log("index el: " + el);
      total *= el;
    }
    newArray.push(total);
  }

  return newArray;
}
