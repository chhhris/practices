

// Example
// Input: [1, 2, 3]        =>  Output: 4
// Input: [1, 2, 4, 1, 5, 12, 5] =>  Output: 17

// Constraints
// Time Complexity: O(N)
// Auxiliary Space Complexity: O(N)

let str = 'abcd';

// a + combos(bcdefghijk)
// b + combos(acdefghijk)
// ...
// ab + combos(cdefghijk)
// ac + combos(bdefghijk)
// ad + combos(bcefghijk)
// ...
// ba + combos(cdefghijk)
// bc + combos(adefghijk)
// ...


function recursiveStringPermutations(str) {
  let set = new Set();

  function combos(str) {
    // base case
    // 1 element
    // loop through string
    if (str.length === 1) {
      return str;
    }

    for (i = 0; i < str.length; i++) {
      let firstChar = str[i];
      let remainingChars = str.slice(0, i) + str.slice(i + 1, str.length);
      set.add(firstChar + combos(remainingChars));
      return
      // add to Set
    }

  }

  combos(str)
  return set;
}

function getPermutations(string) {

    // base case
    if (string.length <= 1) {
        return new Set(string);
    }

    var allCharsExceptLast = string.slice(0, -1);
    var lastChar = string[string.length - 1];

    // recursive call: get all possible permutations for all chars except last
    var permutationsOfAllCharsExceptLast = getPermutations(allCharsExceptLast);

    // put the last char in all possible positions for each of the above permutations
    var permutations = new Set();
    permutationsOfAllCharsExceptLast.forEach(function(permutationOfAllCharsExceptLast) {
        for (var position = 0; position <= allCharsExceptLast.length; position++) {
            var permutation = permutationOfAllCharsExceptLast.slice(0, position) + lastChar + permutationOfAllCharsExceptLast.slice(position);
            permutations.add(permutation);
        }
    });

    return permutations;
}

console.log("\nAnswer:\n", getPermutations(str));

