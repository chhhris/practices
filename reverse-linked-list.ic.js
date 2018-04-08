// Constraints
// Time Complexity: O(N)
// Auxiliary Space Complexity: O(N)

function reverseLinkedList(rootNode) {
  let node = rootNode;
  let prevNode = null;
  let nextNode = null;

  if (!rootNode.next) {
    throw new Error('LL must have 2 or more nodes!')
  }

  while (node) {
    nextNode = node.next;
    node.next = prevNode;

    prevNode = node;
    node = nextNode;
  }

  return prevNode;
}

console.log("\nAnswer:\n", reverseLinkedList(rootNode));


