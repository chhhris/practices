=begin

Given as input:
1. A map which is an array of strings of same lengths where "L" indicates land and "W" indicates water
2. a coordinate marking a point in the ocean

The Challenge:
Find and mark the ocean in the map by changing appropriate W's to O's.

An ocean coordinate is defined to be any coordinate directly adjacent to any other ocean coordinate.


 Examples:

(1)
INPUT:
 map = [ "LLLLLLLLWW",
         "LLLLLLLWWW",
         "WWWLLLLLWW" ]
 coordinate: [0,9]

OUTPUT:
 map = [ "LLLLLLLLOO",
         "LLLLLLLOOO",
         "WWWLLLLLOO" ]


(2)
INPUT:
 map = [ "WWLWLWWWLL",
         "LWLLLWLWLL",
         "LWWWWWLWWW" ]
 coordinate: [0,0]

OUTPUT:
 map = [ "OOLWLOOOLL",
         "LOLLLOLOLL",
         "LOOOOOLOOO" ]
=end

def findOcean(map, latitude, longitude)
   @map_matrix = map.map(&:chars)
   @visited = { [latitude, longitude] => true }
   @queue = [[latitude, longitude]]

   @queue.each do |coordinates|
      latitude, longitude = coordinates[0], coordinates[1]
      @map_matrix[latitude][longitude] = 'O'

      move_vertically(:+, latitude, longitude)
      move_vertically(:-, latitude, longitude)
      move_horizontally(:+, latitude, longitude)
      move_horizontally(:-, latitude, longitude)
   end

   @map_matrix.map!(&:join)
end


def move_vertically(operator, latitude, longitude)
   move = latitude.send(operator, 1)

   while(@map_matrix[move] && @map_matrix[move][longitude] == 'W') do
      if @visited[[move, longitude]].nil?
         @queue.push([move, longitude])
         @visited[[move, longitude]] = true
         @map_matrix[move][longitude] = 'O'
      end
      move = move.send(operator, 1)
   end
end

def move_horizontally(operator, latitude, longitude)
   move = longitude.send(operator, 1)

   while(@map_matrix[latitude][move] && @map_matrix[latitude][move] == 'W') do
      if @visited[[latitude, move]].nil?
         @queue.push([latitude, move])
         @visited[[latitude, move]] = true
         @map_matrix[latitude][move] = 'O'
      end

      move = move.send(operator, 1)
   end
end

map1 = [
         "LLLLLLLLWW",
         "LLLLLLLWWW",
         "WWWLLLLLWW"
       ]

puts "Input"
puts map1.join "\n"

puts "Output"
puts findOcean(map1, 0, 9).join "\n"
