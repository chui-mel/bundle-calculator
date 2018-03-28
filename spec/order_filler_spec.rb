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
      expect(order_filler.fill_order(order).to_s).to include('15 FLAC $1957.5')
    end
  end
end
