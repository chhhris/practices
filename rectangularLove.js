var him = {
    // coordinates of bottom-left corner
    leftX: 1,
    bottomY: 1,

    // width and height
    width: 6,
    height: 3,
};

var her = {
    // coordinates of bottom-left corner
    leftX: 3,
    bottomY: 2,

    // width and height
    width: 4,
    height: 6,
};

function overlap(him, her) {
  // him
  // leftX: 1
  // rightX: 7;
  // bottomY: 1
  // topY: 4;

  // her
  // leftX: 3
  // rightX: 7;
  // bottomY: 2
  // topY: 8;

  // math
  // check for X overlap
  // &&
  // check for Y overlap

  // x overlap
    // if her leftX > his leftX
    // && her leftX < his rightX
    //    --> leftX = her leftX
    //    --> width = Math.min(her rightX, his rightX) - leftX

    // ALTERNATIVE
    // var highestStartPoint = Math.max(herLeftX, hisLeftX);
    // var lowestEndPoint = Math.min(herLeftX + herWidth, hisLeftX + hisWidth);
    // if (lowestEndPoint > highestStartPoint) {  } else { return null; }

    // OR
    // if her leftX < his leftX
    // && her rightX > his leftX
    //    --> leftX = his leftX
    //    --> width = Math.min(her rightX, his rightX) - leftX

  // y overlap
    // if her bottomY < his bottomY
    // && her topY > his bottomY
    //    --> bottomY = his bottomY
    //    --> height = Math.min(her topyY, his topY)
    // OR
    // if her bottomY > his bottomY
    // && her bottomY < his topY
    //    --> bottomY = her bottomY
    //    --> height = Math.min(her topyY, his topY)
}