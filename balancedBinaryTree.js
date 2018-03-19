
function isSuperbalanced(treeRoot) {
  if (!treeRoot) {
      return true;
  }

  const depths = new Set();
  var nodes = [];
  nodes.push([treeRoot, 0]);

  while (nodes.length) {
    var nodePair = nodes.pop();
    var node  = nodePair[0],
        depth = nodePair[1];

    if (node.left) {
      nodes.push([node.left, depth + 1]);
    }

    if (node.right) {
      nodes.push([node.right, depth + 1])
    }

    if (!node.left && !node.right) {
      depths.add(depth);
    }

    if (depths.size > 1) {
      if (depths.size > 2 ) {
        return false;
      }

      var depthsArray = Array.from(depths);
      var depth1 = depthsArray[0],
          depth2 = depthsArray[1];

      if (Math.abs(depth1 - depth2) > 1) {
        return false;
      }
    }
  }

  return true;
}