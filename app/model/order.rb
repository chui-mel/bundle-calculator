# frozen_string_literal: true

class Order
  attr_reader :items

  def initialize
    @items = {}
  end

  def add_item(order_item)
    @items.tap { |hs| hs[order_item.to_s] = order_item }
  end

  def delete_item(order_item)
    @items.tap { |hs| hs.delete(order_item.to_s) }
  end
end
