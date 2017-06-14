# Given a bit array, return it sorted in-place (a bit array is simply an array that contains only bits, either a 1 or a 0).

# See if you can solve this in O(N) time and O(1) auxiliarr space.

require 'byebug'
arr = [1, 0, 0, 1, 1, 1, 0, 1, 0]
# arr = [1, 1, 1, 1,  1, 0]


def swapper(arr)
  left_pointer = 0
  right_pointer = arr.length - 1

  while ( left_pointer < right_pointer ) do
    while (arr[left_pointer] == 0) do
      left_pointer += 1
    end

    while (arr[right_pointer] == 1) do
      right_pointer -= 1
    end

    if (left_pointer < right_pointer)
      temp = arr[left_pointer]
      arr[left_pointer] = arr[right_pointer]
      arr[right_pointer] = temp
    end
  end

  return arr
end

p swapper(arr)