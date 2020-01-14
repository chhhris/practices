# Given a string s and a list of strings dict, you need to add a closed pair of
# bold tag <b> and </b> to wrap the substrings in s that exist in dict. If two
# such substrings overlap, you need to wrap them together by only one pair of
# closed bold tag. Also, if two substrings wrapped by bold tags are consecutive,
# you need to combine them.

# Example 1:
# Input:
s = "abcxyz123"
dict = ["abc","123"]
p add_bold_tags_to_str(s, dict)
# Output:
# "<b>abc</b>xyz<b>123</b>"

# Example 2:
# Input:
s = "aaabbcc"
dict = ["aaa","aab","bc"]
p add_bold_tags_to_str(s, dict)
# Output:
# "<b>aaabbc</b>c"


def add_bold_tags_to_str(str, dict)
  bold_array = Array.new(str.length, 0)
  results_array = []

  update_bold_array(bold_array, dict, str)
  update_results(results_array, bold_array, str)

  results_array.join('')
end

def update_bold_array(bold_array, dict, str)
  dict.each do |el|
    idx = 0
    length = el.length

    while idx <= str.length - length do
      str_chars = str[idx...idx + length]

      if str_chars == el
        bold_array[idx...idx + length] = Array.new(length, 1)
      end

      idx += 1
    end
  end
  p "bold ary: #{bold_array}"
end

def update_results(results_array, bold_array, str)
  index = 0
  prev_index = 0
  while index < str.length do
    char = str[index]
    puts "char: #{char}"

    if bold_array[index] == 1 && (index == 0 || bold_array[prev_index] == 0)
      results_array.push("<b>#{char}")
    elsif bold_array[index] == 0 && bold_array[prev_index] == 1
      results_array.push("</b>#{char}")
    elsif index == str.length - 1 && bold_array[index] == 1
      results_array.push("#{char}</b>")
    else
      results_array.push(char)
    end
    p results_array

    prev_index = index
    index += 1
  end
end

p add_bold_tags_to_str(s, dict)

# 1. create a bold array of 0's to track bolded chars
#
# 2. loop over dict
# for each el in dict, iterate over the string input
# el.length chars at a time (increment 1 char)
#
# 3. if el == if a match,
# update array of 0's setting els at matched indicies to 1's
# e.g. if el == dict[3..5] then update bold array to 1's for indices 3..5
#
# 4. after looping through dict
# initialize empty results array
# loop through string input and bold array concurrently
# push el in str input to results array
# if bold array is 0 at index, push el
# elsif bold array is 0 at prev_index and 1 at index, push '<b>el'
# elsif bold array is 0 at index and 1 at prev_index, push '</b>el'
# join results array into string