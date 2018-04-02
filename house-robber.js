// Example
// Input: [1, 2, 3]        =>  Output: 4
// Input: [1, 2, 4, 1, 5, 12, 5] =>  Output: 17

// Constraints
// Time Complexity: O(N)
// Auxiliary Space Complexity: O(N)

const arr = [1, 2, 4, 36, 37, 12, 5];

function houseRobber(arr) {
  let maxValue = 0;
  let maxOneBack = arr[1],
      maxTwoBack = arr[0];

  for (let i = 2; i < arr.length; i++) {
    maxValue = Math.max(arr[i] + maxTwoBack, maxOneBack);
    maxTwoBack = maxOneBack;
    maxOneBack = maxValue;
  }

  return maxValue;
}

console.log("\nAnswer:\n", houseRobber(arr));