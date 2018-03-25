// Example
// Input: [2, 0, 1, 2, 1, 0]    =>  Output: [0, 0, 1, 1, 2, 2]
// Input: [1, 2, 2, 0]          =>  Output: [0, 1, 2, 2]

// Constraints
// Time Complexity: O(N)
// Auxiliary Space Complexity: O(1)

// const arr = [1, 2, 2, 0]; // [2, 0, 1, 2, 1, 0];
const arr = [2, 0, 1, 2, 1, 0];

function sortColors(arr) {
  const colors = [0, 0, 0];

  for (i = 0; i < arr.length; i++) {
    let color = arr[i];

    colors[color] += 1;
  }

  let pointer = 0;
  for (i = 0; i < arr.length; i++) {
    if (colors[pointer] === 0) {
      pointer++;
    }

    arr[i] = pointer;
    colors[pointer]--;
  }

  return arr;
}

console.log(sortColors(arr));