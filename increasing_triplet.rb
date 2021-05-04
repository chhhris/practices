# @param {Integer[]} nums
# @return {Boolean}
def increasing_triplet(nums)
  return false if nums.length < 4
  i = 0
  j = 1
  k = 2

  nums.each_with_index do |_num, index|
    return false if index + 2 > nums.length

    # check if nums[index] < nums[i]
    # if so, set i = index



    return true if valid_subsequence?(i, j, k, nums)
  end

  valid_subsequence?(i, j, k, nums)
end

def valid_subsequence?(i, j, k, nums)
  inorder = i < j && j < k
  increasing = nums[i] < nums [j] && nums[j] < nums[k]
  increasing_triplet && inorder
end

expectations = [
  [[1,2,3,4,5], true],
  [[5,4,3,2,1], false],
  [[2,1,5,0,4,6], true],
  [[20,100,10,17,12,5,4,3,6,1,7,11], true],
  [[20,100,3,3,4,2,2,1,5,1,1,1,1], true],
  [[20,100,3,3,2,1,1,105], true]
]

expectations.each do |input, expected|
  puts "--------------------"
  puts "input '#{input}'"
  puts ""
  actual = increasing_triplet(input)
  if actual != expected
    puts "FAIL"
    puts "      expected #{expected}"
    puts "      actual #{actual}"
  else
    puts "PASS"
  end
end

start = 0
fin = nums.length - 1

i = start
j = 1
k = fin
while start < fin do
  return true if valid_subsequence?(i, j, k, nums)
  if nums[start] < nums[i]
    i = start
  end

  if nums[fin] > nums[j]
    j = fin
  end

  start += 1
  fin -= 1
end

# [17,10,4,4,4,4,3,6,5,6,4,1,6,1,1,1,1,1,1,5,1,1,1,1]

# [20,100,3,3,4,2,2,1,5,1,1,1,1]
#         i   j       k

# [20,100,3,3,2,1,1,105]
#   i   j             k

<<~HEREDOC
check if nums[index] < nums[i]
  set i = index

check if nums[index+1] < nums[j] && nums[i] < nums[index+1]
  set j = index + 1

check if nums[index+2] < nums[k] && nums[j] < nums[index+2]
  set k = index + 2

HEREDOC