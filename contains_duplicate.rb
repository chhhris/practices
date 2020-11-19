def contains_duplicate(nums)
  return false if nums.length < 2
  seen_integers = {}
  nums.each do |num|
    return true if seen_integers.key? num
    seen_integers[num] = 1
  end
  false
end

# Input: [1,2,3,1]
nums = [3,1]
# true

# Input: [1,2,3,4]
# false

# Input: [1,1,1,3,3,4,3,2,4,2]
# true

test_data = {
  [1,2,3,1] => true,
  [1,2,3,4] => false,
  [1,1,1,3,3,4,3,2,4,2] => true
}

passed = 0
failed = 0
test_data.each_pair do |nums, expected_result|
  if contains_duplicate(nums) == expected_result
    passed += 1
  else
    failed += 1
  end
end
p "succeeded #{passed} / #{test_data.length}"
p "failed #{failed} / #{test_data.length}"
