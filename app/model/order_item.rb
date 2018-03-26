# frozen_string_literal: true

require 'constants'

class OrderItem
  attr_reader :quantity, :format_code

  def initialize(quantity, format_code)
    validate_params(quantity, format_code)

    @quantity = quantity
    @format_code = format_code
  end

  def to_s
    "#{quantity} #{format_code}"
  end

  private

  def validate_params(quantity, format_code)
    raise ArgumentError, 'quantity should be a positive Integer.' unless (quantity.is_a? Integer) && quantity.positive?
    raise ArgumentError, 'format code should be in valid list.' unless Constants::MEDIA_FORMAT.values.include?(format_code)
  end
end
