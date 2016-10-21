require 'spec_helper'
require 'wiki_helper'

describe WikiHelper do
  context 'download_data' do
    let(data) { WikiHelper.download_data('Michal_David') }

    it 'should has some data' do
    end
  end
end