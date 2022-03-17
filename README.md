# 01_Project - Takeaway

## 1. User Story

> As a customer
> So that I can check if I want to order something
> I would like to see a list of dishes with prices.
> 
> As a customer
> So that I can order the meal I want
> I would like to be able to select some number of several available dishes.
> 
> As a customer
> So that I can verify that my order is correct
> I would like to see an itemised receipt with a grand total.
>

Additionally:
> As a customer
> So that I am reassured that my order will be delivered on time
> I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered.
 
## 2. Class System Design
``` ruby
class Dishes
  def intialize
  # ...
  end

  def add_dish(dish) # dish is an instance of Dish
  # adds a dish to the list of dishes
  end

  def list_dishes
  # returns a list of all dishes that have been added to Dishes
  end
end

class Dish
  def initialize(name, price) # name is a string, price is a float
    # ...
  end

  def name
  # returns dish name
  end

  def price
  # returns dish price
  end
end

class Order
  def intialize
  # ...
  end
  
  def add_to_order(dish) # dish is an instance of Dish
  # adds selected dish to order list
  end
end

class Receipt
  def initialize(order) # order is an instance of order
  # ...
  end

  def produce_receipt
  # returns list of items and their prices, plus grand total
  end

  private

  def grand_total
  # returns float representing grand total price of all ordered dishes
  end
end
```