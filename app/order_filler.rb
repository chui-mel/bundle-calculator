# frozen_string_literal: true

class OrderFiller
  def initialize(calculator, bundles)
    @calculator = calculator
    @bundles = bundles
  end

  def fill_order(order)
    filled_order = FilledOrder.new
    order.items.values.each do |item|
      bundles_in_use = @bundles.fetch(item.format_code, nil)
      raise StandardError, 'bundles cannot be nil or empty' if bundles_in_use.nil? || bundles_in_use.bundles.empty?

      filled_order.add_filled_item(fill_order_item(item, bundles_in_use))
    end
    filled_order
  end

  private

  def fill_order_item(order_item, media_bundles)
    filled_quantities = @calculator.fill_number(order_item.quantity, media_bundles.quantities)
    generate_filled_order_item(order_item, filled_quantities, media_bundles)
  end

  def generate_filled_order_item(order_item, filled_quantities, media_bundles)
    filled_order_item = FilledOrderItem.new(order_item.quantity, order_item.format_code)
    filled_quantities.uniq.each do |e|
      bundle_in_use = media_bundles.bundles[e.to_s]
      filled_order_item.add_filled_bundle(FilledBundle.new(filled_quantities.count(e), bundle_in_use.quantity, bundle_in_use.amount))
    end

    filled_order_item
  end
end
