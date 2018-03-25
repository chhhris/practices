// Time O(n)
// Space O(1)

// Example
// Input: [1,2,3] => Output   [1,2,4]
// Input: [1, 9]  => Output:  [2,0]

// Input: [1, 9]  => Output:  [2,0]
const arr = [9, 9, 9]; // [1,2,3];

function addOne(arr) {
  let inputArray = arr;

  for (let i = inputArray.length - 1; i >= 0; i--) {

    if (i >= 0 && inputArray[i] < 9) {
      inputArray[i]++;
      return inputArray;
    }

    while (inputArray[i] === 9) {
      inputArray[i] = 0;
    }

  }

  inputArray.unshift(1);
  return inputArray;
}


console.log(addOne(arr))