class Receipt
  def initialize(order) # order is an instance of order
    @order = order
  end

  def produce_receipt
    formatted_receipt = "Thanks for your order! You have ordered:\n"
    grand_total = 0.00
    ordered_items = @order.list_of_dishes_on_order
    fail "No dishes have been added to order." if ordered_items.empty?
    ordered_items.each { |item|
      price = item.price
      grand_total += price
      formatted_receipt += "#{item.name} - £#{price}\n"
    }
    formatted_receipt += "TOTAL : £#{grand_total}\n" +
    "Enjoy your meal!"
    return formatted_receipt
  # returns list of items and their prices, plus grand total
  end
end