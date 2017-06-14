# Challenge 1: Sort a Bit Array
# Given a bit array, return it sorted in-place (a bit array is simply an array that contains only bits, either 0 or 1).

# See if you can solve this in O(N) time and O(1) auxiliary space.

# Try to solve this using a frequency count rather than using multiple pointers, or using a comparison sort function.

# Input : [0, 1, 1, 0, 1, 1, 1, 0]

# Output : [0, 0, 0, 1, 1, 1, 1, 1]

# Hint 1:
# Since there are only two values we could use a two item array to keep a count of zeros and ones.

# Hint 2:
# After creating and populating a frequency count, how do we use the number of zeros and number of ones to populate the original input array.


arr = [0, 1, 1, 0, 1, 1, 1, 0]

def sort_bit_array(arr)
  tracker = [0, 0]

  arr.each do |val|
    tracker[val] += 1
  end

  # Having a really hard time figuring out how to implement hint #2:
  # After creating and populating a frequency count, how do we use the number of zeros and number of ones to populate the original input array.

  sorted_bits = tracker.map.with_index { |bit_count, index| [index] * bit_count }.flatten
  arr[0...arr.length] = sorted_bits

  return arr
end

p sort_bit_array(arr)