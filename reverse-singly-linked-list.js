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
    this.next = null;
    this.value = value;

  }
}

class LinkedList {
  constructor(){
    this.head = null;
  }

  print(){
    if (this.head) {
      let node = this.head;
      let list = [node.value];

      while (node.next) {
        list.push(node.next.value);
        node = node.next;
      }

      return list;

    } else {
      throw new Error('Empty LinkedList');
    }
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
// {1} -> {2} -> {3} -> {4}





