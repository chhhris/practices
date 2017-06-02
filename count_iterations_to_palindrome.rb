def count_iterations_to_palindrome(int, iterations = 1, reversed_ints_hash = {})
  reversed_int = reverse(int)
  reversed_ints_hash[int] = reversed_int

  sum = int + reversed_int
  reversed_sum = reversed_ints_hash[sum] || reverse(sum)

  if sum == reversed_sum
    return iterations
  elsif iterations > 100
    return false
  else
    iterations += 1
    count_iterations_to_palindrome(sum, iterations, reversed_ints_hash)
  end
end


def reverse(num)
  rev = 0
  while num != 0 do
    rev = (rev * 10) + (num % 10)
    num = num / 10
  end
  return rev
end

int = 348
p count_iterations_to_palindrome(int)

# Given a number, reverse it and add it to original. Check if the sum is palindrom or not. If yes print the number of iterations it took to reach palindrom. If not continue till you find palindrom.
#
# take integer 344
# reverse it 443
# sum integer + reversed
# iteration = 1
# check if palindrom?
# if yes print iteration
# else
# repeat from steps 19
#
# => 543 + 344 = 887 is palindrom?
#
#
# if yes print iteration
# else
# iteration += 1
# => 788 + 887 = sum is palindrom?
# end
#
# return false if iteration > 100
#
#

3