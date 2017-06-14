# no in-place merge sort
# but it is stable



def merge_sort(arr)
  return arr if arr.length < 2

  midpoint = arr.length/2
  left_arr = arr[0...midpoint]
  right_arr = arr[midpoint...arr.length]

  sorted_left = merge_sort(left_arr)
  sorted_right = merge_sort(right_arr)

  result = []

  left_pointer = 0
  right_pointer = 0

  while(left_pointer < sorted_left.length && right_pointer < sorted_right.length) do
    if sorted_left[left_pointer] <= sorted_right[right_pointer]
      result.push(sorted_left[left_pointer])
      left_pointer += 1
    else
      result.push(sorted_right[right_pointer])
      right_pointer += 1
    end
  end

  while left_pointer < sorted_left.length
    result.push(sorted_left[left_pointer])
    left_pointer += 1
  end

  while right_pointer < sorted_right.length
    result.push(sorted_right[right_pointer])
    right_pointer += 1
  end


  return result
end

# https://codepad.remoteinterview.io/DVUGRVDZUS


arr = [5, 4, 7, 9, 6, 2]
arr2 = [5, 3]


# p merge_sort(arr)




