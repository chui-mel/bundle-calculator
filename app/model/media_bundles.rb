# frozen_string_literal: true

require 'constants'

class MediaBundles
  attr_reader :bundles

  def initialize(media_format)
    validate_params(media_format)

    @media_format = media_format
    @format_code = Constants::MEDIA_FORMAT[media_format]
    @bundles = {}
  end

  def add_bundle(submission_bundle)
    @bundles.tap { |hs| hs[submission_bundle.to_s] = submission_bundle }
  end

  def remove_bundle(submission_bundle)
    @bundles.tap { |hs| hs.delete(submission_bundle.to_s) }
  end

  private

  def validate_params(media_format)
    raise ArgumentError, 'media format should be in a valid list.' unless Constants::MEDIA_FORMAT.keys.include?(media_format)
  end
end
