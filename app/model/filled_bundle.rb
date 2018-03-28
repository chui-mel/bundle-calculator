# frozen_string_literal: true

require 'model/constants'

class FilledBundle
  attr_reader :amount

  def initialize(filled_quantity, bundle_quantity, bundle_amount)
    @filled_quantity = filled_quantity
    @bundle_quantity = bundle_quantity
    @bundle_amount = bundle_amount
    @amount = @filled_quantity * @bundle_amount
  end

  def to_s
    "#{@filled_quantity} X #{@bundle_quantity} $#{@amount}"
  end
end
