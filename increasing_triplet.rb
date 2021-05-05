# @param {Integer[]} nums
# @return {Boolean}
def increasing_triplet(nums)
  min = Float::INFINITY
  next_min = Float::INFINITY
  nums.each do |num|
    if num <= min
      min = num
    elsif num <= next_min
      next_min = num
    else
      return true
    end
  end
  false
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
