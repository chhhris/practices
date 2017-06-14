# arr1, arr2 = [1,3,5, 11, 13, 14, 17], [2,4,6,8,10]
arr1, arr2 = [], []
# output ==> [1,2,3,4,5,6,8,10]


def merge_two_sorted_arrays(arr1, arr2)
  combined_arr = []
  combined_length = arr1.length + arr2.length

  counter1 = 0
  counter2 = 0

  while (counter1 + counter2 < combined_length) do
    arr1_complete = counter1 >= arr1.length
    arr2_complete = counter2 >= arr2.length

    if  arr2_complete || (!arr1_complete && arr1[counter1] <= arr2[counter2])
      combined_arr << arr1[counter1]
      counter1 += 1
    else
      combined_arr << arr2[counter2]
      counter2 += 1
    end
  end

  return combined_arr
end

p merge_two_sorted_arrays(arr1, arr2)