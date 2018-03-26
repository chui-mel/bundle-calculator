# frozen_string_literal: true

module Algorithm
  class MininumBundles
    def fill_number(total_number, bundles)
      sorted_bundles = bundles.sort { |a, b| b <=> a }

      not_filled_number = total_number + offset_of(total_number, sorted_bundles)
      filled = []

      sorted_bundles.each do |s|
        count = not_filled_number / s
        not_filled_number = not_filled_number % s

        count.times { filled << s } if count.positive?
      end

      filled.flatten
    end

    private

    def offset_of(total_number, bundles)
      offset = total_number
      bundles.each { |s| offset = offset % s }
      offset.zero? ? 0 : (bundles.last - offset)
    end
  end
end
