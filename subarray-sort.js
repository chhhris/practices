// Example
// Input: [3, 4, 8, 7, 10, 6, 17]  => Output: [2, 5]
// Input: [3, 4, 8, 7, 20, 6, 17]  => Output: [2, 6]

// Constraints
// Time Complexity: O(N)
// Auxiliary Space Complexity: O(1)

// [3, 4, 8, 18, 21, 6, 17]
// find index where min < value
// find index where max > value

// [2, 3, 4, 7, 8, 1]
const arr = [3, 4, 8, 7, 20, 6, 17];

function subarraySort(arr) {
  let start;
  let end;
  let min;
  let max;

  // loop l : r find first val < previous
  for (i = 0; i < arr.length; i++) {
    let current = arr[i];
    let prev = arr[i - 1];

    if (current < prev) {
      start = i - 1;
      break;
    }
  }

  // loop r : l find first val > prev
  for (j = arr.length - 1; j >= 0; j--) {
    let current = arr[j];
    let prev = arr[j + 1];

    if (current > prev) {
      end = j + 1;
      break;
    }
  }

  for (k = start; k <= end; k++) {
    if (!min || arr[k] < min) {
      min = arr[k];
    }
    if (!max || arr[k] > max) {
      max = arr[k];
    }
  }

  let startIndex;
  let endIndex;
  for (l = 0; l < arr.length; l++) {
    if (!startIndex && arr[l] > min) {
      startIndex = l;
    }

    if (!endIndex && arr[l] > max) {
      endIndex = l - 1;
    }
  }

  endIndex = typeof endIndex === 'undefined' ? arr.length-1 : endIndex;

  return [startIndex, endIndex];
}

console.log("\nAnswer:\n", subarraySort(arr));
