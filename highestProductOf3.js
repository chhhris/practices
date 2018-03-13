var arrayOfInts = [1, -5, -10, 6, -11, 8];
// highestProductOf3(arrayOfInts)

function highestProductOf3(arrayOfInts) {
  var highestProductOf3 = arrayOfInts[0] * arrayOfInts[1] * arrayOfInts[2],
      highestProductOf2 = arrayOfInts[0] * arrayOfInts[1],
      lowestProductOf2  = arrayOfInts[0] * arrayOfInts[1],
      highest = Math.max(arrayOfInts[0], arrayOfInts[1]),
      lowest = Math.min(arrayOfInts[0], arrayOfInts[1]);


  for (i = 2; i < arrayOfInts.length; i++) {
    var current = arrayOfInts[i];

    highestProductOf3 = Math.max(
      highestProductOf3,
      highestProductOf2 * current,
      lowestProductOf2 * current
    );


    highestProductOf2
    lowestProductOf2
    highest
    lowest
  }

};
