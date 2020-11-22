# Given an array of numbers:
# * maintain the sort order for non-zero numbers,
# * while moving all zero numbers to the endx.
#
# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
def move_zeroes(nums)
  i = 0
  last_index = nums.length - 1
  loop do
    break if i == last_index
    if nums[i] == 0
      iterator = 1
      while nums[i+iterator] == 0
        iterator += 1
      end
      if !nums[i+iterator].nil?
        nums[i], nums[i+iterator] = nums[i+iterator], 0
      end
    end
    i+=1
  end
  nums
end
# [0,1,0,3,12]
# [1,3,12,0,0]
# nums = [0,1,0,3,12]
# expected = [1,3,12,0,0]

nums = [2,1]
expected = [2,1]

# [0,0,1,0]
# [0,0,0,1]
# nums = [0,0,1,0]
# expected = [1,0,0,0]

results = move_zeroes(nums)

if results != expected
  puts <<-MSG
    FAILURE
    - Expected: #{expected}
    + Actual: #{results}
  MSG
else
  puts <<-MSG
    PASSED\n
    Expected/Actual: #{results}\n
  MSG
end


  # [0,0,1,0,0]
  # [0,0,0,0,1]

  # [0,0,1,0]
  # [0,0,0,1]

  # [0]
  # [0]

  # [1, 0]
  # [0, 1]

  # [0, 9, 0, 9, 0, 0, 1]
  # moved non-zeroes in-order to the right-most
  # counted the number of zeroes, added to left-most
  # [0, 0, 0, 0, 9, 9, 1]

  # last_zero = nil
#   for pointer in 0...nums.length do
#     p "num, pointer => #{nums[pointer]}, #{pointer}"
#     if nums[pointer] == 0

#     end
#     pointer += 1
#   end
# end
