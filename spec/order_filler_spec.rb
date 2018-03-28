# frozen_string_literal: true

require 'spec_helper'

describe 'Order filler' do
  context 'when filling order with media bundles' do
    let(:order_filler) { OrderFiller.new(calculator, bundles) }
    let(:calculator) { Algorithm::MininumBundles.new }

    let(:order) { Order.new }
    let(:bundles) { {} }
    let(:image_bundles) { MediaBundles.new('Image') }
    let(:audio_bundles) { MediaBundles.new('Audio') }
    let(:video_bundles) { MediaBundles.new('Video') }

    before do
      order.add_item(OrderItem.new(10, 'IMG'))
      order.add_item(OrderItem.new(15, 'Flac'))
      order.add_item(OrderItem.new(13, 'VID'))

      image_bundles.add_bundle(SubmissionBundle.new(5, 450))
      image_bundles.add_bundle(SubmissionBundle.new(10, 800))

      audio_bundles.add_bundle(SubmissionBundle.new(3, 427.50))
      audio_bundles.add_bundle(SubmissionBundle.new(6, 810))
      audio_bundles.add_bundle(SubmissionBundle.new(9, 1147.50))

      video_bundles.add_bundle(SubmissionBundle.new(3, 570))
      video_bundles.add_bundle(SubmissionBundle.new(5, 900))
      video_bundles.add_bundle(SubmissionBundle.new(9, 1530))

      bundles['IMG']  = image_bundles
      bundles['FLAC'] = audio_bundles
      bundles['VID']  = video_bundles
    end

    it 'fills order with correct bundles' do
      # {"IMG":{"10":{"format_code":"IMG","quantity":1,"amount":"$800","bundle":{"quantity":10,"amount":"$800"}}},
      #  "FLAC":{"9":{"format_code":"FLAC","quantity":1,"amount":"$1147.5","bundle":{"quantity":9,"amount":"$1147.5"}},
      #          "6":{"format_code":"FLAC","quantity":1,"amount":"$810","bundle":{"quantity":6,"amount":"$810"}}},
      #  "VID":{"9":{"format_code":"VID","quantity":1,"amount":"$1530","bundle":{"quantity":9,"amount":"$1530"}},
      #         "5":{"format_code":"VID","quantity":1,"amount":"$900","bundle":{"quantity":5,"amount":"$900"}}}}
      expect(order_filler.fill_order(order)['FLAC'][6][:amount]).to eq '$810'
    end
  end
end
