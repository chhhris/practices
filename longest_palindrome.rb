require 'byebug'
# @param {String} s
# @return {String}
def longest_palindrome(s)
  return s if s.length < 2
  longest = ''

  s.each_char.with_index do |char, index|
    len1 = expand_from_center(s, index, index)
    len2 = expand_from_center(s, index, index+1)
    len  = [len1, len2].max

    if longest.length < len
      start = index - (len - 1) / 2
      ending = index + len / 2
      longest = s[start..ending]
    end
  end

  longest
end


def expand_from_center(s, l, r)
  while l >=0 && r < s.length && s[l] == s[r]
    l -= 1
    r += 1
  end
  r - l - 1
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