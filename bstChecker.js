

function isBinarySearchTree(treeRoot, lowerBound, upperBound) {

    lowerBound = (typeof lowerBound !== 'undefined') ? lowerBound : -Infinity;
    upperBound = (typeof upperBound !== 'undefined') ? upperBound :  Infinity;

    if (!treeRoot) return true;

    if (treeRoot.value >= upperBound || treeRoot.value <= lowerBound) {
        return false;
    }

    return isBinarySearchTree(treeRoot.left, lowerBound, treeRoot.value) &&
           isBinarySearchTree(treeRoot.right, treeRoot.value, upperBound);

}