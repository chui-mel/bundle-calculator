# frozen_string_literal: true

class OrderParser
  SPERATOR = ' '

  def parse(lines)
    order = Order.new
    lines.each do |line|
      order.add_item(parse_item(line))
    end
    order
  end

  private

  def parse_item(line)
    item_attr = line.strip.split(SPERATOR).delete_if { |e| e.strip.empty? }
    raise StandardError, "Item format is not correct #{line}" unless item_attr.size == 2
    OrderItem.new(item_attr[0].to_i, item_attr[1])
  end
end
