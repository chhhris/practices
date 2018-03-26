# array = [1, 2, 3, nil, nil, 4, 5]
#       0  1  2   3    4   5  6

# flipped
array = [1, 3, 2, 5, 4, nil, nil]
#       0  1  2  3  4   5    6
# 0
# 1, 2
# 3, 4, 5, 62
# 7, 8, 9, 10, 11, 12, 13, 14

# Array
def invert_binary_tree!(array)
  height = Math.log2(array.length + 1)
  start_pointer = 0

  (0...4).each do |idx|
    num_elements_in_subarray = 2 ** idx
    end_pointer = start_pointer + num_elements_in_subarray
    subarray = array[start_pointer...end_pointer]
    reversed_subarray = reverse_elements_in_array(subarray)
    array[start_pointer...end_pointer] = reversed_subarray
    start_pointer = end_pointer
  end

  return array
end

def reverse_elements_in_array(arr)
  start_pointer = 0
  end_pointer = arr.length - 1

  while (start_pointer < end_pointer) do
    arr[start_pointer], arr[end_pointer] = arr[end_pointer], arr[start_pointer]
    start_pointer += 1
    end_pointer -= 1
  end

  arr
end


# Nodes
p invert_binary_tree!(array)