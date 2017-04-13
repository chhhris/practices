# binary search
def lookup(ary, value_to_find)
  length = ary.length
  
  if length < 2 && ary[0] != value_to_find
    return false 
  end
  
  midpoint_index = length / 2
  midpoint_value = ary[midpoint_index]

  if value_to_find == midpoint_value
    return true
  elsif value_to_find < midpoint_value
    lookup(ary[0...midpoint_index], value_to_find)
  elsif value_to_find > midpoint_value
    lookup(ary[midpoint_index..-1], value_to_find)
  end
end

ary = [1, 2, 3, 5, 6, 7, 8, 9, 10, 11, 13, 25, 27, 27, 29, 31, 35, 37, 40, 41, 44, 47, 51, 55, 67, 68, 69, 71, 89, 91, 92]
value_to_find = 40