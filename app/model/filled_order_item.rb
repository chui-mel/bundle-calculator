# frozen_string_literal: false

class FilledOrderItem
  def initialize(item_quantity, item_format)
    @item_quantity = item_quantity
    @item_format = item_format
    @filled_bundles = []
  end

  def add_filled_bundle(filled_bundle)
    @filled_bundles << filled_bundle
  end

  def to_s
    item_str = "#{@item_quantity} #{@item_format} $#{total_amount}\n"
    @filled_bundles.each do |bundle|
      item_str << "  #{bundle}\n"
    end
    item_str
  end

  def total_amount
    @filled_bundles.map(&:amount).reduce(:+)
  end
end
