require 'spec_helper'
require 'wiki_helper'

describe WikiHelper do
  context 'download_data' do
    let(:data) {
      WikiHelper.download_data('Michal_David', '2016100100', '2016100107') }

    it 'should has some data' do
      expect(data['items']).not_to be(nil)
    end

    it 'should has some data' do
      expect(data['items'].size).to be > 0
    end
  end
end
