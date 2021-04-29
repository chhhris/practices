require 'set'
# @param {String} s
# @return {String}
def longest_palindrome(s)
  return s if s.length < 2
  palindromes = Set.new
  substrings = {}

  s.each_char.with_index do |char, index|
    substring = char
    palindromes << char # base case single char

    s.chars[index+1..-1].each do |inner_char|
      substring += inner_char
      if substrings[substring] || substring == substring.reverse
        palindromes << substring unless substrings[substring]
        substrings[substring] = true
      end
    end
  end

  palindromes.max {|a, b| a.length <=> b.length}
end

expectations = [
  [
    "babad",
    "bab" # or "aba"
  ],
  [
    "cbbd",
    "bb"
  ],
  [
    "cbbdbz",
    "bdb"
  ],
  [
    "a",
    "a"
  ],
  [
    "ac",
    "a"
  ],
]

expectations.each do |input, expected|
  puts "--------------------"
  puts ""
  puts "input '#{input}'"
  puts ""
  actual = longest_palindrome(input)
  if actual != expected
    puts "FAIL"
    puts "      expected #{expected}"
    puts "      actual #{actual}"
  else
    puts "PASS"
  end
  puts ""
end

# e.g. "cbbdbz"
#
# perms     # symmetry?
# --------------------
# c         # symmetry
# cb
#  b
# cbb
#  bb       # symmetry
#   b       # symmetry
# cbbd
#  bbd
#   bd
#    d      # symmetry
# cbbdb
#  bbdb
#   bdb     # symmetry
#    db
#     b     # symmetry
# cbbdbz
#  bbdbz
#   bdbz
#    dbz
#     bz
#      z    # symmetry