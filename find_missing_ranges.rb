# @param {Integer[]} nums
# @param {Integer} lower
# @param {Integer} upper
# @return {String[]}
def find_missing_ranges(nums, lower, upper)
  if nums.length < 1
    str = if lower == upper
      "#{lower}"
    else
      "#{lower}->#{upper}"
    end
    return [str]
  end

  output = []

  if lower < (num = nums.first)
    if (num - lower).abs < 2
      output << "#{lower}"
    else
      output << "#{lower}->#{num-1}"
    end
  end

  nums.each_with_index do |num, index|
    next if index == nums.length-1
    next_num = nums[index+1]
    str = str(num, next_num)
    output << str if str
  end

  if (num = nums.last) < upper
    if (upper - num).abs < 2
      output << "#{upper}"
    else
      output << "#{num+1}->#{upper}"
    end
  end

  output
end

def str(lower, upper)
  if lower == upper
    "#{lower}"
  elsif (upper - lower).abs == 2
    "#{upper - 1}"
  elsif (upper - lower).abs == 1
    nil
  else
    "#{lower+1}->#{upper-1}"
  end
end

expectations = [
  [
    [nums = [0,1,3,50,75], lower = 0, upper = 99],
    ["2","4->49","51->74","76->99"]
  ],
  [
    [nums = [], lower = 1, upper = 1],
    ["1"]
  ],
  [
    [nums = [], lower = -3, upper = -1],
    ["-3->-1"]
  ],
  [
    [nums = [-1], lower = -1, upper = -1],
    []
  ],
  [
    [nums = [-1], lower = -2, upper = -1],
    ["-2"]
  ],
  [
    [[-1], -1, 0],
    ["0"]
  ],
  [
    [[2], 0, 9],
    ["0->1","3->9"]
  ],
  [
    [[7], 0, 9],
    ["0->6","8->9"]
  ],
  [
    [[5,8], 0, 9],
    ["0->4","6->7","9"]
  ],
  [
    [[6,8,9], 0, 9],
    ["0->5","7"]
  ]
]

expectations.each do |input, expected|
  puts "--------------------"
  puts "input '#{input}'"
  puts ""
  actual = find_missing_ranges(*input)
  if actual != expected
    puts "FAIL"
    puts "      expected #{expected}"
    puts "      actual #{actual}"
  else
    puts "PASS"
  end
end