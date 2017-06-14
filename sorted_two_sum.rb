arr = [2, 4, 6, 8, 9, 10, 14, 16, 20]
target = 9

# arr = [2, 4, 5, 7, 8, 10]
# target = 11

# arr = [1, 4, 5, 6, 8, 9]
# target = 11


# Given a sorted array of integers and a target value, determine if there exists two integers in the array that sum up to the target value.

def sorted_two_sum(arr, target)
  left = 0
  right = arr.length - 1

  while (arr[left] + arr[right]) != target do
    if left > right
      return false
    end

    sum = arr[left] + arr[right]

    if sum > target
      right -= 1
    end

    if sum < target
      left += 1
    end
  end

  return true
end

p sorted_two_sum(arr, target)


