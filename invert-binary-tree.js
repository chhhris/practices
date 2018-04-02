// Constraints
// Time Complexity: O(N)
// Auxiliary Space Complexity: O(N)

function invertBinaryTree(rootNode) {

  function swap(node) {
    if (!node) { return node; }

    let left = node.left;
    let right = node.right;

    [node.left, node.right] = [right, left]

    swap(left);
    swap(right);
  }
  swap(rootNode);

  return rootNode;
}

console.log("\nAnswer:\n", invertBinaryTree(rootNode));
