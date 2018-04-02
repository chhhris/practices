# https://www.interviewcake.com/question/javascript/cake-thief

def max_duffel_bag_value(cake_arrays, capacity)
  sorted_cakes_by_kilo = cake_arrays.sort_by do |cake_array|
    value_per_kg = cake_array[1] / cake_array[0]
  end.reverse

  current_value = 0
  cake_pointer = 0

  while capacity > 0 do
    weight, value = sorted_cakes_by_kilo[cake_pointer][0], sorted_cakes_by_kilo[cake_pointer][1]

    cake_multiple = capacity / weight

    if cake_multiple > 0
      current_value = cake_multiple * value
      capacity -= cake_multiple
    end

    cake_pointer += 1
  end

  return current_value
end

cake_arrays = [[7, 160], [3, 90], [2, 15]]
capacity = 20

p max_duffel_bag_value(cake_arrays, capacity)