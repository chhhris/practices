# values = [1, 7, 3, 4]
values = [3, 1, 2, 5, 6, 4]
# values_index = [1, 3, 3, 6, 30, 180]

def get_products_of_all_ints_except_at_index(values)
  if values.length < 2
    raise IndexError, 'Getting the product of numbers at other indices requires at least 2 numbers'
  end

  left_index_products = []
  left_product = 1
  (0...values.length).each do |i|
    left_index_products[i] = left_product
    left_product *= values[i]
  end

  right_product = 1
  i = values.length - 1
  while(i >= 0)
    left_index_products[i] *= right_product
    right_product *= values[i]
    i -= 1
  end

  p left_index_products
end


# def get_products_of_all_ints_except_at_index(values)
#   new_array = []

#   return if values.length < 3

#   (0...values.length).each do |index|
#     left_product = values[0...index].inject(:*) 
#     right_product = values[(index+1)..(-1)].inject(:*)
#     product = (left_product || 1) * (right_product || 1)

#     new_array << product
#   end

#   p new_array
# end

get_products_of_all_ints_except_at_index(values)