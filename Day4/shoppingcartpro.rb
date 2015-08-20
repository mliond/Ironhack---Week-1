require 'awesome_print'

class ShoppingCart
  def initialize
    @total_items = []
  end

  def add_item_to_cart(item)
    @total_items.push(item)
    show_cart
  end

  def show_cart
    ap @total_items
  end
end

class Item
  def initialize(name, price)
    @name = name
    @price = price
  end
end

banana = Item.new("banana", 20)

my_cart = ShoppingCart.new
my_cart.add_item_to_cart(banana)