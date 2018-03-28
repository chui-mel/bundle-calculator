# frozen_string_literal: false

class FilledOrder
  def initialize
    @filled_items = []
  end

  def add_filled_item(filled_order_item)
    @filled_items << filled_order_item
  end

  def to_s
    output = "Filled Order:\n"
    @filled_items.each do |item|
      output << item.to_s
    end
    output
  end
end
