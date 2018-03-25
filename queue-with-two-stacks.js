// Constraints
// enqueue :  Time Complexity: O(1) ,  Auxiliary Space Complexity: O(1)
// dequeue:   Time Complexity: O(N), Auxiliary Space Complexity: O(1)

class Queue {
  constructor() {
    this.inbox = [];
    this.outbox = [];
  }

  enqueue(val) {
    this.inbox.push(val);
  }

  dequeue() {
    if (this.inbox.length < 1 && this.outbox.length < 1) {
      throw new Error('Queue is empty');
    }

    if (this.outbox.length < 1) {
      while (this.inbox.length > 0) {
        let val = this.inbox.pop();
        this.outbox.push(val);
      }
    }

    return this.outbox.pop();
  }
}
