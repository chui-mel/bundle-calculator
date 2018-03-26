# frozen_string_literal: true

require 'spec_helper'

describe 'Order' do
  context 'when intialising an order' do
    let(:order) { Order.new }

    let(:order_item_1) { OrderItem.new(3, 'IMG') }
    let(:order_item_2) { OrderItem.new(10, 'Flac') }
    let(:order_item_3) { OrderItem.new(10, 'VID') }

    before do
      order.add_item(order_item_1)
      order.add_item(order_item_2)
      order.add_item(order_item_3)
    end

    it 'shows correct information' do
      expect(order.items.keys).to match_array(['3 IMG', '10 Flac', '10 VID'])
    end

    it 'shows correct information when deleting one order itme' do
      order.delete_item(order_item_2)
      expect(order.items.keys).to match_array(['3 IMG', '10 VID'])
    end
  end
end
