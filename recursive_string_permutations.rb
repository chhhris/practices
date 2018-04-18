require 'set'
require 'byebug'

def recursive_string_permutations(str)
  if str.length < 2
    return Set.new [str]
  end

  all_chars_except_last = str[0...-1]
  last_char = str[-1]

  permutations_of_all_chars_except_last = recursive_string_permutations(all_chars_except_last)

  permutations = Set.new
  permutations_of_all_chars_except_last.each do |permutation_except_last|
    (0..all_chars_except_last.length).each do |position|
      permutation = permutation_except_last[0...position] + last_char + permutation_except_last[position..-1]
      permutations.add(permutation)
    end
  end

  return permutations
end

mine = recursive_string_permutations('abcd')

def get_permutations(string)

  # base case
  if string.length <= 1
    return Set.new [string]
  end

  all_chars_except_last = string[0..-2]
  last_char = string[-1]

  # recursive call: get all possible permutations for all chars except last
  permutations_of_all_chars_except_last = get_permutations(all_chars_except_last)

  # put the last char in all possible positions for each of the above permutations
  permutations = Set.new
  permutations_of_all_chars_except_last.each do |permutation_of_all_chars_except_last|
    (0..all_chars_except_last.length).each do |position|
      permutation = permutation_of_all_chars_except_last[0...position] + last_char + permutation_of_all_chars_except_last[position..-1]
      permutations.add(permutation)
    end
  end

  return permutations
end

parkers = get_permutations('abcd')

puts mine == parkers
