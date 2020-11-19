def single_number(nums)
  nums.sort!
  current_index = 0
  next_index = 1
  while next_index <= nums.length
    first_num = nums[current_index]
    puts "first_num #{first_num}"
    second_num = nums[next_index]
    puts "second_num #{second_num}"
    return first_num if second_num.nil? || first_num != second_num
    current_index += 2
    puts "current_index #{current_index}"
    next_index += 2
    puts "next_index #{next_index}"
  end
end
