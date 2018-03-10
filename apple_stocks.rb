stock_prices_yesterday = [10, 7, 12, 5, 8, 11, 9]
stock_prices_yesterday = [10, 7, 5, 1]
get_max_profit(stock_prices_yesterday)


def get_max_profit(stock_prices_yesterday)
  if stock_prices_yesterday.length < 2
    raise ArgumentError, 'Getting a profit requires at least 2 prices'
  end

  current_buy = stock_prices_yesterday[0]
  current_max_profit = stock_prices_yesterday[1] - stock_prices_yesterday[0]

  stock_prices_yesterday.each_with_index do |current_price, index|
    next if index == 0

    potential_profit = current_price - current_buy
    if potential_profit > current_max_profit
      current_max_profit = potential_profit
    end

    if current_buy > current_price
      current_buy = current_price
    end
  end
  current_max_profit
end