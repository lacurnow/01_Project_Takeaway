class Dishes
  def initialize
    @list_of_dishes = []
  end

  def add_dish(dish)
    @list_of_dishes << dish
  end

  def list_dishes
    fail "No dishes have been added." if @list_of_dishes.empty?
    return @list_of_dishes
  end

  def read_dish_list
    formatted_list_of_dishes = "Dishes to order:\n"
    @list_of_dishes.each {|dish|
      formatted_list_of_dishes += "#{dish.name} : £#{dish.price}\n"
    }
    return formatted_list_of_dishes
  end
end