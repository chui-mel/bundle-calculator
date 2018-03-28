# frozen_string_literal: true

module Algorithm
  class MininumBundles
    def fill_number(total_number, bundles)
      sorted_bundles = bundles.sort { |a, b| b <=> a }
      chosen_bundles = choose_bundles(total_number, sorted_bundles)

      not_filled_number = total_number + offset_of(total_number, chosen_bundles)
      filled = []

      chosen_bundles.each do |s|
        count = not_filled_number / s
        not_filled_number = not_filled_number % s

        count.times { filled << s } if count.positive?
      end

      filled.flatten
    end

    private

    def choose_bundles(total_number, bundles)
      offsets = []

      array_index = 0
      while array_index < bundles.size
        offset = offset_of(total_number, bundles[array_index..-1])
        return bundles[array_index..-1] if offset.zero?
        offsets << offset
        array_index += 1
      end

      bundles[offsets.index(offsets.min)..-1]
    end

    def offset_of(total_number, bundles)
      offset = total_number
      bundles.each { |s| offset = offset % s }
      offset.zero? ? 0 : (bundles.last - offset)
    end
  end
end
