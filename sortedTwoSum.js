// Given a sorted array of integers and a target value, determine if there exists two integers in the array that sum up to the target value.

// Constraints
// Time Complexity: O(N)
// Auxiliary Space Complexity: O(1)

// let arr = [1, 5, 13, 2, 9, -6, 18, 3];
const arr = [1, 2, 5, 8, 13, 22];
const target = 36;

function sortedTwoSum(arr, target) {
  let leftPointer = 0;
  let rightPointer = arr.length - 1;

  while (leftPointer < rightPointer) {
    if (arr[leftPointer] + arr[rightPointer] === target) {
      return true;
    } else if (arr[leftPointer] + arr[rightPointer] > target) {
      rightPointer--;
    } else if (arr[leftPointer] + arr[rightPointer] < target) {
      leftPointer++;
    }
  }

  return false;
}

// function unsortedTwoSum(arr, target) {
//   let diffs = {};

//   for (let i = 0; i < arr.length; i++) {
//     let currentInt = arr[i];
//     let diffInt = target - currentInt;

//     diffs[diffInt] = 1;

//     if (diffs[currentInt]) {
//       return true;
//     }
//   }

//   return false;
// }

console.log("\nSolution:\n", sortedTwoSum(arr, target));