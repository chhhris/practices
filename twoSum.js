// Example
// Input: [1, 6, -5, 7, 3], -2  => Output:  [2,4]
// Input: [1, 9, 10], 8         =>  Output: [-1,-1]

// Constraints
// Time O(n)
// Space O(n)


const arr = [1, 9, 10]; //[1, 6, -5, 7, 3];
const target = -2;

function twoSum(arr, target) {
    const diff      = {};
    const indices   = [];

    for (i = 0; i < arr.length; i++) {
        let currentValue = arr[i];
        let currentDiff  = target - currentValue;

        if (diff[currentDiff]) {
            indices.push(diff[currentDiff], i);
            return indices;
        } else {
            diff[currentValue] = i;
        }
    }

    return [-1,-1];
}

console.log(twoSum(arr, target));