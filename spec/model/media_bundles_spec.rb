# frozen_string_literal: true

require 'spec_helper'

describe 'Media bundles' do
  context 'when intialising an media_bundles' do
    let(:media_bundles) { MediaBundles.new('Image') }

    let(:bundle_1) { SubmissionBundle.new(3, 200) }
    let(:bundle_2) { SubmissionBundle.new(10, 600) }
    let(:bundle_3) { SubmissionBundle.new(15, 800) }

    before do
      media_bundles.add_bundle(bundle_1)
      media_bundles.add_bundle(bundle_2)
      media_bundles.add_bundle(bundle_3)
    end

    it 'shows correct information' do
      expect(media_bundles.bundles.keys).to match_array(%w[3 10 15])
    end

    it 'shows correct information when deleting one media_bundles itme' do
      media_bundles.remove_bundle(bundle_1)
      expect(media_bundles.bundles.keys).to match_array(%w[10 15])
    end

    context 'when added a submission bundle with duplicated quality' do
      let(:bundle_4) { SubmissionBundle.new(15, 1000) }

      it 'throws ArgumentError' do
        expect { media_bundles.add_bundle(bundle_4) }.to raise_error(ArgumentError)
      end
    end
  end

  context 'when initializing with with wrong arguments' do
    it 'throws ArgumentError when media format is not a valid value' do
      expect { MediaBundles.new('media format') }.to raise_error(ArgumentError)
    end
  end
end
