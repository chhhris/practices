my_array     = [3, 4, 6, 10, 11, 15]
alices_array = [1, 2,
  5, 8, 12, 14, 19, 27]

def merge_arrays(my_array, alices_array)
  my_length = my_array.length - 1
  alices_length = alices_array.length - 1
  merged_array = []

  my_idx = 0
  alice_idx = 0
  while(my_idx <= my_length || alice_idx <= alices_length) do
    if my_array[my_idx] && my_array[my_idx] < alices_array[alice_idx]
      merged_array << my_array[my_idx]
      my_idx += 1
    else
      merged_array << alices_array[alice_idx]
      alice_idx += 1
    end
  end

  merged_array
end

p merge_arrays(my_array, alices_array)
# prints  [1, 3, 4, 5, 6, 8, 10, 11, 12, 14, 15, 19]
#         [1, 3, 4, 5, 6, 8, 10, 11, 12, 14, 15, 19]