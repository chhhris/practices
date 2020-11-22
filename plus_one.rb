# @param {Integer[]} digits
# @return {Integer[]}
# def plus_one(digits)
#   if digits.length < 2
#     if digits[0] == 9
#       digits = [1, 0]
#     else
#       digits[0] += 1
#     end
#     return digits
#   end

#   pointer = digits.length - 1

#   loop do
#     if digits[pointer] == 9
#       digits[pointer] = 0
#       pointer -= 1
#     elsif pointer <= 0 && digits[pointer] == 0
#       digits.unshift 1
#       break
#     else
#       digits[pointer] += 1
#       break
#     end
#   end
#   digits
# end

def plus_one(digits)
  padding = []
  pointer = 0
  while digits[pointer] == 0 do
    if digits[pointer + 1] != 9 && pointer < (digits.length - 1)
      padding << 0
      pointer += 1
    else
      break
    end
  end

  num = digits.join('').to_i
  num += 1
  num = num.to_s.each_char.map(&:to_i)

  if !padding.empty?
    return padding + num
  end

  num
end

# Input: digits = [1,2,3]
# Output: [1,2,4]

# Input: digits = [4,3,2,1]
# Output: [4,3,2,2]

# Input: digits = [0,0]
digits = [0,0]
# digits = [4,3,2,9]
# digits = [9]
# digits = [0]
# digits = [9,9,9,9]

p plus_one(digits)
