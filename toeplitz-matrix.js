// Example
// Input: An N x N matrix
// Output: Boolean

// Constraints
// Time Complexity: O(N^2)
// Auxiliary Space Complexity: O(1)
const matrix = [[3, 4, 5, 4],
                [2, 3, 4, 5],
                [1, 2, 3, 4],
                [1, 1, 2, 3]];

function toeplitzMatrix(matrix) {
  for (let i = 0; i < matrix.length; i++) {

    if (i === 0) {
      let firstRow = matrix[0];

      for (let j = 0; j < firstRow.length - 1; j++) {
        let firstEl = firstRow[j];

        for (let k = j + 1, l = 1; matrix[l] && k < matrix[l].length; k++, l++) {
          // console.log('j: ', j, ' k: ', k, ' l:', l);
          // console.log('firstEl => ', firstEl);
          // console.log('matrix[l][k] => ', matrix[l][k]);

          if (firstEl !== matrix[l][k]) {
            // console.log('\n trigger');
            // console.log('j: ', j, ' k: ', k, ' l:', l);
            // console.log('firstEl => ', firstEl);
            // console.log('matrix[l][k] => ', matrix[l][k]);

            return false;
          }
        }
      }
    } else {
      let el = matrix[i][0];

      for (let k = i + 1, l = 1; matrix[k]; k++, l++) {
        if (el !== matrix[k][l]) {
          console.log('el: ', el, ' k: ', k, ' matrix: ', matrix[k][k]);
          return false;
        }
      }
    }
  }

  return true;
}

console.log("\nAnswer:\n", toeplitzMatrix(matrix));