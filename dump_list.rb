

# INPUT function args: nested list, str
# OUTPUT print str + depth + index + value

# loop through nested_list while tracking index
# if element is a string
#   print print str + depth + index + value
# else if element is a nested list
#   recurse through dump_list passing nested list and str as args

# TODO calculate depth

# base case
# loop through nested_list => all strings
# increment @depth
# return

# list = ['a string', ['a','b','c'], 'spam', ['eggs']]
# 0. Foo.0 : 'a string'

# 1. is_a? Array
  # parent_depth == 1
  # call dump_list, passing parent_depth
    # child_index
    # Foo 0

nested_list = ['a string', ['a','b','c'], 'spam', ['eggs']]
str = 'Foo'

def dump_list(nested_list, str, depth_with_index = nil)
  current_index = 0

  nested_list.each do |el|
    index_to_print = depth_with_index ? "#{depth_with_index}.#{current_index}" : current_index
    # byebug
    if el.is_a? String
      p "#{str}.#{index_to_print}: #{el}"
    else
      dump_list(el, str, index_to_print)
    end

    current_index += 1
  end
end

dump_list(nested_list, str)



# def dump_list(str, nested_list)
#   current_index = 0
#   intro_text = "#{str}.#{current_index}"

#   nested_list.each do |el|
#     if el.is_a? String
#       p "#{intro_text}#{el}"
#     else
#       dump_list(intro_text, el)
#     end

#     current_index += 1
#   end
# end