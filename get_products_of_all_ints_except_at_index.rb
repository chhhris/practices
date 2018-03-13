ary = [1, 7, 3, 4]

# O(n^2)
def get_products_of_all_ints_except_at_index(ary)
  return_array = []

  ary.each_with_index do |el, index|
    dup_ary = ary.dup
    dup_ary -= [el]

    return_array << dup_ary.inject(:*)
  end

  return_array
end