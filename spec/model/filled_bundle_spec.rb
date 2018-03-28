# frozen_string_literal: true

require 'spec_helper'

describe 'Filled Bundle' do
  context 'when intialising a filled bundle' do
    let(:filled_bundle) { FilledBundle.new(2, 10, 123.4) }
    it 'returns correct information' do
      expect(filled_bundle.to_s).to eq '2 X 10 $246.8'
    end
  end
end
