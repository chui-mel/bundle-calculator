# frozen_string_literal: true

class SubmissionBundle
  attr_reader :quantity, :amount

  def initialize(quantity, amount)
    validate_params(quantity, amount)

    @quantity = quantity
    @amount = amount
  end

  def to_s
    "#{quantity} $#{amount}"
  end

  def unit_cost
    amount.to_f / quantity
  end

  private

  def validate_params(quantity, amount)
    raise ArgumentError, 'quantity should be a positive Integer.' unless (quantity.is_a? Integer) && quantity.positive?
    raise ArgumentError, 'amount should be a positive Numeric.' unless (amount.is_a? Numeric) && amount.positive?
  end
end
