stock_prices = [8, 10, 2, 5, 9, 7]
# stock_prices = [8, 4, 1]

def get_max_profit(stock_prices)
  return if stock_prices.length < 2
  
  min_price = stock_prices[0]
  max_profit = stock_prices[1] - min_price

  stock_prices.each_with_index do |current_price, index|
    next if index == 0

    potential_profit = current_price - min_price
    max_profit = [max_profit, potential_profit].max
    min_price = [min_price, current_price].min
  end

  puts max_profit
end

# def get_max_profit(stock_prices)
#   buy_price = stock_prices[0]
#   sell_price = stock_prices[1...(-1)].max
#   current_max_profit = sell_price - buy_price

#   stock_prices.each_with_index do |current_price, index|
#     next if index == 0 || current_price == stock_prices[-1]

#     max_sell = stock_prices[(index + 1)..(-1)].max
#     potential_profit = max_sell - current_price

#     if potential_profit > current_max_profit
#       current_max_profit = potential_profit
#       buy_price = current_price
#       sell_price = max_sell
#     end
#   end

#   puts current_max_profit
# end

get_max_profit(stock_prices)