# frozen_string_literal: true

require 'spec_helper'

describe 'Order Item' do
  context 'when intialising an order item' do
    subject(:order_item) { OrderItem.new(10, 'IMG') }

    its(:quantity) { is_expected.to eq 10 }
    its(:format_code) { is_expected.to eq 'IMG' }

    it 'shows correct information' do
      expect(order_item.to_s).to eq '10 IMG'
    end
  end

  context 'when initalising with wrong arguments' do
    it 'throws ArgumentError when quantity is not an integer' do
      expect { OrderItem.new('dfdf', 'IMG') }.to raise_error(ArgumentError)
    end

    it 'throws ArgumentError when quantity is not positive' do
      expect { OrderItem.new(0, 'IMG') }.to raise_error(ArgumentError)
    end

    it 'throws ArgumentError when format code is not in constants' do
      expect { OrderItem.new(3, 'test code') }.to raise_error(ArgumentError)
    end
  end
end
