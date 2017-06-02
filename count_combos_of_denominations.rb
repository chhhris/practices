# input:  target amount $$, array of denominations
# output: count of combinations

# e.g.

require 'byebug'

target = 10
denominations = [2, 3, 5, 6]

def count_combos(target, denominations)
  @count ||= 0

  denominations.each_with_index do |coin, index|

    if coin == target
      @count += 1
    end

    if coin < target
      coin_counts = target / coin

      while coin_counts > 0

        if coin * coin_counts == target
          @count += 1
        else
          new_target = target - (coin_counts * coin)
          sub_array_of_denominations = denominations[(index + 1)..denominations.length]

          count_combos(new_target, sub_array_of_denominations)
        end

        coin_counts -= 1
      end
    end

  end

  return @count
end

p count_combos(target, denominations)