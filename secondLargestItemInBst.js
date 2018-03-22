
function findLargestValue(rootNode) {
    let currentNode = rootNode;
    let stack = [currentNode];

    while (stack.length) {
        currentNode = stack.shift();

        if (currentNode.right) {
            stack.push(currentNode.right);
        }
    }

    return currentNode.value;
}

function secondLargestItemInBst(rootNode){
    if (!rootNode || (!rootNode.left && !rootNode.right)) {
        throw new Error('Tree must have at least 2 nodes');
    }

    let currentNode = rootNode;
    let stack = [currentNode];

    while (stack.length) {
        currentNode = stack.shift();

        // we're at largest, and largest has left sub tree
        if (!currentNode.right && currentNode.left) {
            return findLargestValue(currentNode.left);
        }

        // we're at parent of largest, and largest has no left or right sub tree
        if (currentNode.right &&
                !currentNode.right.left &&
                !currentNode.right.right) {
            return currentNode.value;
        }

        // otherwise, step right
        stack.push(currentNode.right);
    }
}



function secondLargestItemInBst(rootNode){
  let stack = [rootNode];

  while (stack.length) {
    let currentNode = stack.shift();
    if (currentNode.ri)




    // find largest
    if (currentNode.right) {
      stack.push(currentNode.right);

      if (currentLargest < currentNode.right.value) {
        currentLargest = currentNode.right.value;
      }

      if (secondLargest < currentNode.value) {
        secondLargest = currentNode.value;
      }

      secondLargest = currentNode.value;
    }

    if (!currentNode.right && currentNode.left) {
      stack.push(currentNode.left);
      currentLargest = currentNode.value;
      secondLargest = currentNode.left.value;
    }
  }

  // start with root node
  // if rightChild === null
  // then largest = root
  // to find secondLargestproceed, traverse left children down to right-most child

  // if rightChild !== null
  // then traverse right side updating currentLargest and secondLarget
}