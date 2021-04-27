# Given an array of strings strs, group the anagrams together.
# You can return the answer in any order.

# An Anagram is a word or phrase formed by rearranging the letters
# of a different word or phrase, typically using all the original
# letters exactly once.

# @param {String[]} strs
# @return {String[][]}
def group_anagrams(strs)
  map = {}

  strs.each do |str|
    map[str.chars.sort] = []
  end

  strs.each do |str|
    sorted_str = str.chars.sort
    if map[sorted_str]
      map[sorted_str] << str
    end
  end

  map.values
end
# map.values.sort { |a, b| a.length <=> b.length }

expectations = [
  [
    ["eat","tea","tan","ate","nat","bat"], # input
    [["bat"],["nat","tan"],["ate","eat","tea"]], # output
  ],
  [
    [""],
    [[""]],
  ],
  [
    ["a"],
    [["a"]],
  ]
]

expectations.each do |input, expected|
  puts "input #{input}"
  actual = group_anagrams(input)
  if actual != expected
    puts "FAIL"
    puts "expected #{expected}"
    puts "actual #{actual}"
  else
    puts "PASS"
  end
end