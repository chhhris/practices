
def max_profit(prices)
  current_profit = 0
  return current_profit if prices.length < 2

  min = 0
  max = 1

  0.upto(prices.length - 2) do
    current_price = prices[min]
    next_price = prices[max]

    if current_price < next_price
      current_profit += (next_price - current_price)
    end

    min += 1
    max += 1
  end

  current_profit
end

prices = [7,6,4,3,1]
# prices = [7,1,5,3,6,4]
# prices = [1,2,3,4,5]

array_of_prices = [
  [7,6,4,3,1],
  [7,1,5,3,6,4],
  [1,2,3,4,5]
]

array_of_prices.each do |price|
  puts "prices #{prices}"
  puts "profit #{max_profit(price)}"
end
