# frozen_string_literal: true

require 'model/constants'

class MediaBundles
  attr_reader :format_code, :bundles

  def initialize(media_format)
    validate_params(media_format)

    @media_format = media_format.upcase
    @format_code = Constants::MEDIA_FORMAT[@media_format]
    @bundles = {}
  end

  def quantities
    bundles.values.map(&:quantity)
  end

  def add_bundle(bundle)
    raise ArgumentError, 'duplicated quantity in submission bundle.' if quantities.include?(bundle.quantity)
    @bundles.tap { |hs| hs[bundle.quantity.to_s] = bundle }
  end

  def remove_bundle(bundle)
    @bundles.tap { |hs| hs.delete(bundle.quantity.to_s) }
  end

  private

  def validate_params(media_format)
    raise ArgumentError, 'media format should be in a valid list.' unless Constants::MEDIA_FORMAT.keys.include?(media_format.upcase)
  end
end
