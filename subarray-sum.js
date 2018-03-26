// Example
// Input: [6,12,1,7,5,2,3], 14   =>  Output: true (7+5+2)
// Input: [8,3,7,9,10,1,13], 50  =>  Output: false

// Constraints
// Time Complexity: O(N)
// Auxiliary Space Complexity: O(1)

const arr = [8,3,7,9,10,1,13];
const target = 50;

function subarraySum(arr, target) {
  let currentSum = arr[0];
  let start = 0;

  for (i = 1; i < arr.length; i++) {
    if (currentSum === target) {
      return true;
    }

    currentSum += arr[i];

    if (currentSum > target) {
      start++;
      currentSum = currentSum - arr[start];
    }
  }

  return false;
}

console.log("\nAnswer:\n", subarraySum(arr, target));