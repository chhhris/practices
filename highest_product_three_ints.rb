# array_of_ints = [2, 5, 8]
# array_of_ints = [2, 59, 8, 14, 4]
# array_of_ints = [-5, -9, 8, 14, -1]
array_of_ints = [-5, -9, 8, 14, 0]
# array_of_ints = [-5, 14, 0]
# array_of_ints = [8, 4, 2, -5, -10]
# array_of_ints = [1, 10, -5, 1, -100]


def highest_product_three_ints(array_of_ints)
  if array_of_ints.length < 3 
    raise Exception, 'Needs at least 3 items!'
  end

  lowest = [array_of_ints[0], array_of_ints[1]].min
  lowest_product_of_2 = array_of_ints[0] * array_of_ints[1]
  
  highest = [array_of_ints[0], array_of_ints[1]].max
  highest_product_of_2 = array_of_ints[0] * array_of_ints[1]
  highest_product_of_3 = array_of_ints[0] * array_of_ints[1] * array_of_ints[2]
  
  array_of_ints.each_with_index do |current, index|
    next if index < 2

    highest_product_of_3 = [highest_product_of_3, highest_product_of_2 * current, lowest_product_of_2 * current].max
    
    highest_product_of_2 = [highest_product_of_2, highest * current, lowest * current].max
    lowest_product_of_2 = [lowest_product_of_2, highest * current, lowest * current].min

    highest = [highest, current].max
    lowest = [lowest, current].min
  end

  puts highest_product_of_3
end

highest_product_three_ints(array_of_ints)