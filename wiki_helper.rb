require 'oj'

module WikiHelper
  URL = 'https://wikimedia.org/api/rest_v1/' \
    'metrics/pageviews/per-article/cs.wikipedia.org' \
    '/all-access/all-agents/#page#/daily/#datefrom#/#dateto#'

  class << self
    def download_data(page, from, to)
      # TODO
      # prepare URL and download data from last 7 days
      # for page: https://cs.wikipedia.org/wiki/Michal_David request looks like:
      # https://wikimedia.org/api/rest_v1/metrics/pageviews/per-article \
      #   /cs.wikipedia.org/all-access/all-agents/Michal_David/daily/20161001/20161007
      response = Typhoeus.get(url).body
      Oj.load(response, mode: :compat)
    end
  end
end
