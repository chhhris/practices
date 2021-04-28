require 'byebug'
# Given a string s, find the length of the longest substring without repeating characters.

# @param {String} s
# @return {Integer}

def length_of_longest_substring(s)
  return 0 if s == nil.to_s
  max = 0
  current = [s[0]]

  s.each_char do |char|
    if index = current.index(char)
      current.slice!(0..index)
      current << char
    else
      current << char
    end
    max = [current.size, max].max
  end

  max
end

expectations = [
  [
    "abcabcbb", # input
    3 # output
    # Explanation: The answer is "abc", with the length of 3.
  ],
  [
    "bbbbb",
    1
    # Explanation: The answer is "b", with the length of 1.
  ],
  [
    "pwwkew",
    3
    # Explanation: The answer is "wke", with the length of 3.
    # Notice that the answer must be a substring, "pwke" is a subsequence and not a substring.
  ],
  [
    "",
    0
  ],
  [
    "dvdf",
    3
  ]
]

if true
  expectations.each do |input, expected|
    puts "--------------------"
    puts "input '#{input}'"
    puts ""
    actual = length_of_longest_substring(input)
    if actual != expected
      puts "FAIL"
      puts "      expected #{expected}"
      puts "      actual #{actual}"
    else
      puts "PASS"
    end
  end
end