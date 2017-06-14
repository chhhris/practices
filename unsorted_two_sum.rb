# require 'byebug'

arr, target = [4,2,6,1,7,14,10], 13



def unsorted_two_sum(arr, target)
  tracker = {}
  counter = 0

  while (counter < arr.length) do
    current = arr[counter]
    diff = target - current

    if tracker[current]
      return true
    end

    tracker[diff] = true
    counter += 1
  end

  return false
end
