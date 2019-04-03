def stock_picker(prices)
  new_price = []
  profits = {}
  loop_amount = prices.length - 1

  loop_amount.times do
    new_price << buy_price = prices.shift
    prices.length.times do |index|
      sell_price = prices[index]
      profits["#{sell_price} - #{buy_price}"] = sell_price - buy_price
    end
  end

  max_profit = profits.values.max
  best_buy_and_sell_price = profits.key(max_profit).split(' - ')

  best_buy_day = new_price.index(best_buy_and_sell_price[1].to_i)
  best_sell_day = new_price.index(best_buy_and_sell_price[0].to_i)

  [best_buy_day, best_sell_day].inspect
end

puts stock_picker([17, 3, 6, 9, 15, 8, 6, 1, 10])
