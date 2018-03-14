var meetings =  [
    {startTime: 0,  endTime: 1},
    {startTime: 3,  endTime: 5},
    {startTime: 10, endTime: 12},
    {startTime: 4,  endTime: 8},
    {startTime: 9,  endTime: 10},
];
console.log(mergingRanges(meetings));

function mergingRanges(meetings) {

  var sortedMeetings = meetings.slice().sort(function(a, b) {
    return a.startTime - b.startTime;
  });

  var mergedMeetings = [sortedMeetings[0]];

  for (i = 1; i < sortedMeetings.length; i++) {
    var currentMeeting  = sortedMeetings[i];
    var lastMeeting     = mergedMeetings[mergedMeetings.length - 1];

    if (currentMeeting.startTime <= lastMeeting.endTime) {
      lastMeeting.endTime = Math.max(currentMeeting.endTime, lastMeeting.endTime)
    } else {
      mergedMeetings.push(currentMeeting);
    }
  }

  return mergedMeetings;
}