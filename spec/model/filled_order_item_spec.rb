# frozen_string_literal: true

require 'spec_helper'

describe 'Filled Order Item' do
  context 'when creating a filled order item' do
    let(:filled_order_item) { FilledOrderItem.new(15, 'FLAC')}

    before do
      filled_order_item.add_filled_bundle(FilledBundle.new(1, 9, 1147.5))
      filled_order_item.add_filled_bundle(FilledBundle.new(1, 6, 810))
    end

    it 'returns correct amount' do
      expect(filled_order_item.total_amount).to eq 1957.5
    end
  end
end
