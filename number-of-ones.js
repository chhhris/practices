// Example
// Input: [0, 0, 0, 1, 1, 1] =>  Output: 3
// Input: [0, 0, 0, 0]   =>  Output: 0

// Constraints
// Time Complexity: O(logN)
// Auxiliary Space Complexity: O(1)

const arr = [0, 0, 0, 0];
// const arr = [0, 0, 1, 1, 1, 1, 1];

function numberOfOnes(arr) {
  if (arr[arr.length - 1] === 0) {
    return 0;
  }

  if (arr[0] === 1) {
    return arr.length;
  }

  let start = 0;
  let end   = arr.length - 1;
  let mid   = Math.floor((end - start)/2);

  while ( !(arr[mid] === 1 && arr[mid-1] === 0) ) {
    if (arr[mid] === 1) {
      end = mid;
    } else {
      start = mid;
    }
    mid = Math.floor(start + (end - start)/2);
  }

  return (arr.length - mid);
}

console.log("\nAnswer:\n", numberOfOnes(arr));