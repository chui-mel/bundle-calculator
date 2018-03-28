# frozen_string_literal: true

class OrderFiller
  def initialize(calculator, bundles)
    @calculator = calculator
    @bundles = bundles
  end

  def fill_order(order)
    filled = {}
    order.items.values.each do |item|
      bundles_in_use = @bundles.fetch(item.format_code, nil)
      raise StandardError, 'bundles cannot be nil or empty' if bundles_in_use.nil? || bundles_in_use.bundles.empty?

      filled[item.format_code] = fill_order_item(item, bundles_in_use)
    end
    filled
  end

  private

  def fill_order_item(order_item, media_bundles)
    filled_quantities = @calculator.fill_number(order_item.quantity, media_bundles.quantities)

    filled_items = {}
    filled_quantities.uniq.each do |e|
      bundle_in_use = media_bundles.bundles[e.to_s]
      filled_items[e] = FilledOrderItem.new(media_bundles.format_code,
                                            filled_quantities.count(e),
                                            bundle_in_use.quantity,
                                            bundle_in_use.amount).to_json
    end

    filled_items
  end
end
