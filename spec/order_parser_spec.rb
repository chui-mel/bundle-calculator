# frozen_string_literal: true

require 'spec_helper'

describe 'Order Parser' do
  context 'when all input lines are correct' do
    let(:parser) { OrderParser.new }
    let(:lines) { ['10 IMG', '15 FLAC', '13 VID'] }

    it 'returns an Order' do
      expect(parser.parse(lines)).to be_a(Order)
    end
  end
end
