# frozen_string_literal: true

require 'spec_helper'

describe 'Submission Bundle' do
  context 'when intialising a submission bundle' do
    let(:bundle) { SubmissionBundle.new(3, 294) }

    it 'shows correct information' do
      expect(bundle.to_s).to eq '3 $294'
    end

    it 'returns correct unit cost' do
      expect(bundle.unit_cost).to eq 98.0
    end
  end

  context 'when initalising with wrong arguments' do
    it 'throws ArgumentError when quantity is not an integer' do
      expect { SubmissionBundle.new('dfdf', 294) }.to raise_error(ArgumentError)
    end

    it 'throws ArgumentError when quantity is not positive' do
      expect { SubmissionBundle.new(0, 123) }.to raise_error(ArgumentError)
    end

    it 'throws ArgumentError when amount is not a numeric' do
      expect { SubmissionBundle.new(3, 'test amount') }.to raise_error(ArgumentError)
    end

    it 'throws ArgumentError when amount is not positive' do
      expect { SubmissionBundle.new(10, -123, 2) }.to raise_error(ArgumentError)
    end
  end
end
