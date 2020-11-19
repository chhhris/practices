def rotate(nums, k)
  k.times do
    last_el = nums.pop
    nums.unshift(last_el)
  end
  nums
end

# Input: nums = [1,2,3,4,5,6,7], k = 3
# Output: [5,6,7,1,2,3,4]
nums = [1,2,3,4,5,6,7]
k = 3

# Input: nums = [-1,-100,3,99], k = 2
# Output: [3,99,-1,-100]
rotate(nums, k)
