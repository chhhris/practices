// Example
// Input: An N x N matrix
// Output: Boolean

// Constraints
// Time Complexity: O(N^2)
// Auxiliary Space Complexity: O(1)
const matrix = [[3, 4, 5, 6],
                [2, 3, 4, 5],
                [1, 2, 3, 4],
                [0, 1, 2, 3]];

function toeplitzMatrix(matrix) {
  for (i = 0; i < matrix.length; i++) {

    if (i === 0) {
      let firstRow = matrix[0];
      for (j = 0; j < firstRow.length; j++) {
        let firstRowEl = firstRow[j];
        let diagonalEl = matrix[i + 1]

        firstRow[j] === [j + 1];

        if () {

        }
      }
    }
  return true;
  }
}

console.log("\nAnswer:\n", toeplitzMatrix(matrix));