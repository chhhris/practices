var amount        = 5;
var denominations = [1, 3, 5];

// bottom up
function changePossibilitiesBottomUp(amount, denominations) {

    // intialize an array of zeros with indices up to amount
    var waysOfDoingNcents = [];
    for (var i = 0; i <= amount; i++) {
        waysOfDoingNcents[i] = 0;
    }
    waysOfDoingNcents[0] = 1;
    // waysOfDoingNcents = [ 1, 0, 0, 0, 0, 0 ]

    denominations.forEach(function(coin) {
        // coin = 1
        for (var higherAmount = coin; higherAmount <= amount; higherAmount++) {
            // coin = 5
            // higherAmount = 5
            // amount = 5
            var higherAmountRemainder = higherAmount - coin;
            // higherAmountRemainder = 0

            waysOfDoingNcents[higherAmount] += waysOfDoingNcents[higherAmountRemainder];
            // waysOfDoingNcents[5] += waysOfDoingNcents[0];
            // waysOfDoingNcents[5] += 1
            // waysOfDoingNcents = [ 1, 1, 1, 2, 2, 3 ]
        }
    });

    return waysOfDoingNcents[amount];
}






console.log(coinDenominations(amount, denominations));

// 1 => 1¢, 1¢, 1¢, 1¢
// 2 => 1¢, 1¢, 2¢
// 3 => 1¢, 3¢
// 4 => 2¢, 2¢

// top down
function coinDenominations(amount, denominations) {
  var listOfDenominations = [];

  for (i = denominations.length - 1; i >= 0; i--) {
    var denomination = denominations[i];
    var denominator = Math.floor(amount/denomination)
    var combo = [];

    for (i = denominator; i >= 0; i--) {
      denominator
    }
  }

}

// loop through denominations in desc order
// for each denomination
// if amount > denomination
//  --> n times = Math.floor(amount/denomination)
//      for (n; n >= 0; n--) {
//        b = amount - (n * denomation)
//        recursively call coinDenominations(b, denominations.splice(i, denominations.length - i))

//        add to listOfDenomations
//      }
//


// recursion
// memoization (?)

