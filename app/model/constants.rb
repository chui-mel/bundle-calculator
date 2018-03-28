# frozen_string_literal: true

class Constants
  MEDIA_FORMAT =
    { 'IMAGE' => 'IMG',
      'AUDIO' => 'FLAC',
      'VIDEO' => 'VID' }.freeze

  BUNDLE_LIST = {
    'IMG'  => [[5, 450], [10, 800]],
    'FLAC' => [[3, 427.50], [6, 810], [9, 1147.50]],
    'VID'  => [[3, 570], [5, 900], [9, 1530]]
  }.freeze
end
