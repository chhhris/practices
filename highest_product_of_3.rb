ary_of_ints = [1, -5, -10, 6, -11, 8]
# highest_product_of_3(ary_of_ints)

def highest_product_of_3(ary_of_ints)
  highest_product_of_3 = ary_of_ints[0] * ary_of_ints[1] * ary_of_ints[2]

  highest_product_of_2 = ary_of_ints[0] * ary_of_ints[1]
  lowest_product_of_2 = ary_of_ints[0] * ary_of_ints[1]

  highest_int = ary_of_ints.first(2).max
  lowest_int = ary_of_ints.first(2).min

  ary_of_ints.each_with_index do |current, index|
    next if index < 2

    highest_product_of_3 = [
      highest_product_of_3,
      highest_product_of_2 * current,
      lowest_product_of_2 * current
    ].max

    highest_product_of_2 = [
      highest_product_of_2,
      highest_int * current,
      lowest_int * current
    ].max

    lowest_product_of_2 = [
      lowest_product_of_2,
      highest_int * current,
      lowest_int * current
    ].min

    highest_int = [highest_int, current].max

    lowest_int = [lowest_int, current].min
  end

  highest_product_of_3
end

puts highest_product_of_3(ary_of_ints)
