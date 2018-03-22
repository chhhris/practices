let arr1 = [1,3,5];
let arr2 = [2,4,6,8,10];

function mergeTwoSortedArrays(arr1, arr2) {
  var pointer1 = 0;
  var pointer2 = 0;
  var sortedArray = [];

  while (sortedArray.length < arr1.length + arr2.length) {

    if (arr1.length > 0 && arr1[pointer1] < arr2[pointer2]) {
      sortedArray.push(arr1[pointer1]);
      pointer1++;
    } else {
      sortedArray.push(arr2[pointer2]);
      pointer2++;
    }
  }

  return sortedArray;
}

console.log(mergeTwoSortedArrays(arr1, arr2));