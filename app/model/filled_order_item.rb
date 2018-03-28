# frozen_string_literal: true

class FilledOrderItem
  def initialize(format_code, filled_quantity, bundle_quantity, bundle_amount)
    @format_code = format_code
    @filled_quantity = filled_quantity
    @amount = bundle_amount * filled_quantity
    @bundle_quantity = bundle_quantity
    @bundle_amount = bundle_amount
  end

  def to_json
    {
      format_code: @format_code,
      quantity: @filled_quantity,
      amount: "$#{@amount}",
      bundle: {
        quantity: @bundle_quantity,
        amount: "$#{@bundle_amount}"
      }
    }
  end
end
