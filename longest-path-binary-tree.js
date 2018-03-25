// Example
// Input: Binary tree Output: integer

// Constraints
// Time Complexity: O(N)
// Auxiliary Space Complexity: O(N)

// with RECURSION
function longestPathOfBinaryTree(node) {
  if (!node) {
    throw new Error('Tree must not be null');
  }

  let max = 0;

  function search(node, length) {
    if (!node) {
      return;
    }

    max = Math.max(max, length);
    search(node.left, length + 1);
    search(node.right, length + 1);
  }

  search(node, 1);
  return max;
}

// with STACK
function longestPathOfBinaryTree(node) {
  if (!node) {
    throw new Error('Tree must not be null');
  }

  let longestPath = 1;
  let stack = [[node, 1]];

  while (stack.length > 0) {
    let nodePair  = stack.pop();
    let node      = nodePair[0];
    let length    = nodePair[1];

    longestPath = Math.max(longestPath, length);

    if (node.left) {
      stack.push([node.left, length + 1]);
    }

    if (node.right) {
      stack.push([node.right, length + 1]);
    }
  }

  return longestPath;
}

// console.log("\nAnswer:\n", longestPathOfBinaryTree(tree));