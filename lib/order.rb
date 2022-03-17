class Order
  def initialize
    @order_list = []
  end
  
  def add_to_order(dish, dishes) 
    list_of_available_dishes = dishes.list_dishes
    if list_of_available_dishes.include? dish
      @order_list << dish
    else
      fail "This dish is not currently available"
    end
  end

  def list_of_dishes_on_order
    return @order_list
  end

  def remove_from_order(dish)
    fail "This dish hasn't been ordered." if !@order_list.include?(dish)
    @order_list.delete(dish)
  end
end