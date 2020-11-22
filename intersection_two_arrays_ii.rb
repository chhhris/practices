# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Integer[]}
def intersect(nums1, nums2)
  num_count = {}
  overlap = []

  nums1.each do |num1|
    num_count[num1] ||= 0
    num_count[num1] += 1
  end

  nums2.each do |num2|
    if num_count[num2] && num_count[num2] > 0
      num_count[num2] -= 1
      overlap << num2
    end
  end

  overlap
end

# nums1 = [1]
# nums2 = [1]

# nums1 = [4,9,5]
# nums2 = [9,4,9,8,4]

# nums1 = [1,2,2,1]
# nums2 = [2,2]

# nums1 = [2,1]
# nums2 = [1,2]


puts ''
p intersect(nums1, nums2)


# Input: nums1 = [1,2,2,1], nums2 = [2,2]
# Output: [2,2]

# Input: nums1 = [4,9,5], nums2 = [9,4,9,8,4]
# Output: [4,9]



# match the arrays at index 0
# loop through the shorter array comparing each el at the corresponding index

# if there is a matching `el`, store it in a current overlap array var
# if the next pair of `el`s also match, add the el to the current overlap array var
# compare the max_overlap array var with the current overlap, set max_overlap to whichever
# array is longer

# after cycling through shorter array, compare index 0 of the shorter array to index 1 of the
# longer array.
# and so on, comparing index 0 to next index, until the last el in the shorter array the
# is matched to the last el in the longer array
# (i.e. next index + shorter array.length == longer array.length)
#
# return max overlap


# nums2 =       [2,2]
# nums1 = [1,2,2,1,7]

# while pointer < nums1.size
#   puts "cycle: #{pointer}"

#   nums1.each_with_index do |num1, num1_index|
#     puts "nums1 loop index #{num1_index} value #{num1}"

#     if num1_index >= nums2.size
#       puts "reached end of nums2"
#       pointer += 1
#       break
#     end

#     puts "comparing num1 with nums2"
#     puts "#{num1} == #{nums2[pointer + num1_index]}"

#     if num1 == nums2[pointer + num1_index]
#       puts "matched values"
#       current_overlap << num1
#       puts "current_overlap #{current_overlap}"
#     else
#       current_overlap = [] # reset current_overlap
#       puts "resetting current overlap"
#     end

#     if current_overlap.size > max_overlap.size
#       max_overlap = current_overlap
#       puts "max_overlap #{max_overlap}"
#     end
#   end
#   puts "end of cycle pointer value #{pointer}"
#   # pointer += 1
# end
