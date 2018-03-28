# frozen_string_literal: true

require 'spec_helper'

describe 'Minimum number bundles algorithm' do
  let(:greedy) { Algorithm::MininumBundles.new }

  context 'when only with 1 bundle' do
    let(:numbers_1) { [1] }
    it 'for number 5, it should choose 5 bundles' do
      expect(greedy.fill_number(5, numbers_1)).to match_array([1, 1, 1, 1, 1])
    end
  end

  context 'when with 2 bundles' do
    context 'if cannot get exactly equality' do
      let(:numbers_2) { [11, 23] }

      it 'for number 42, it should choose 1 bundles' do
        expect(greedy.fill_number(42, numbers_2)).to match_array([11, 11, 11, 11])
      end
    end
  end

  context 'when with 3 bundles' do
    context 'if can get exactly equality' do
      let(:numbers_3) { [1, 5, 2] }

      it 'for number 11, it should choose 3 bundles' do
        expect(greedy.fill_number(11, numbers_3)).to match_array([5, 5, 1])
      end
    end

    context 'if can get exactly equality without bigest one' do
      let(:numbers_3) { [3, 5, 9] }

      it 'for number 13, it should choose 2 bundles' do
        expect(greedy.fill_number(13, numbers_3)).to match_array([5, 5, 3])
      end
    end

    context 'if cannot get exactly equality' do
      let(:numbers_3) { [3, 6, 9] }

      it 'for number 16, it should choose 2 bundles' do
        expect(greedy.fill_number(16, numbers_3)).to match_array([9, 9])
      end
    end
  end

  context 'when with 5 bundles' do
    context 'if can get exactly equality' do
      let(:numbers_5) { [2, 5, 10, 20, 45] }

      it 'for number 100, it should choose 3 bundles' do
        expect(greedy.fill_number(100, numbers_5)).to match_array([45, 45, 10])
      end
    end

    context 'if cannot get exactly equality' do
      let(:numbers_5) { [3, 6, 9, 12, 37] }

      it 'it should choose different bundles' do
        expect(greedy.fill_number(102, numbers_5)).to match_array([6, 12, 12, 12, 12, 12, 12, 12, 12])
        expect(greedy.fill_number(105, numbers_5)).to match_array([9, 12, 12, 12, 12, 12, 12, 12, 12])
        expect(greedy.fill_number(106, numbers_5)).to match_array([37, 37, 12, 12, 9])
      end
    end
  end
end
