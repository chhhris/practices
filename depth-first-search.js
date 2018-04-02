

// if left
// go left

// if no

function depthFirstSearch(rootNode, k) {
  let results = [];

  function traverse(node) {
    if (node.right) {
      traverse(node.right);
    }

    results.push(node.value);

    if (node.left) {
      traverse(node.left);
    }
  }
  traverse(rootNode);

  return results;
}

// Example
// Input:  {1} -> {2} -> {3} -> {4}
// Output: {4} -> {3} -> {2} -> {1}

// Constraints
// Time Complexity: O(N)
// Auxiliary Space Complexity: O(1)

// The linked list has the following properties
//    head : pointer to the head node
// Each node in the linked list has the following properties
//    next: pointer to the next node in the linked list, the default would be null
//    value: integer value of the node
// Values of the nodes will be integers

class Node {
  constructor(value) {
    this.left = null;
    this.right = null;
    this.value = value;

  }
}

function reverseLinkedList(head) {
  if (!head.next) {
    throw new Error('Must have more than 1 node');
  }

  let prev = null;
  let current = head;
  let next = current.next;

  while (current) {
    current.next = prev;

    prev = current;
    current = next;

    if (next) {
      next = current.next;
    }
  }

  head = prev;
}
n7 = new Node(7);
n8 = new Node(8);
n10 = new Node(10);
n12 = new Node(12);
n13 = new Node(13);
n14 = new Node(14);
n15 = new Node(15);

n8.left = n3;
n8.right = n10;
n3.left = n1;
n3.right = n6;
n6.left = n4;
n6.right = n7;
n8.right = n10;
n10.right = n14;
n14.left = n13;
n13.left = n12;
n14.right = n15;







