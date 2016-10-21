require 'spec_helper'
require 'wiki_helper'

describe WikiHelper do
  context 'download_data' do
    let(:data) do
      WikiHelper.download_data('Michal_David', '2016100100', '2016100107')
    end

    it 'should has some data' do
      expect(data['items']).not_to be(nil)
    end

    it 'should has some data' do
      expect(data['items'].size).to be > 0
    end
  end

  context 'prepare_url' do
    let(:url) do
      WikiHelper.send(:prepare_url, 'Michal_David', '2016100100', '2016100100')
    end

    it 'should has return url' do
      expect(url.class).to be(String)
    end

    it 'should has url' do
      expect(url).to match(%r{Michal_David/daily/2016100100/2016100100})
    end
  end
end
