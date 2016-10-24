require 'oj'
require 'typhoeus'
require 'cgi'

module WikiHelper
  URL = 'https://wikimedia.org/api/rest_v1/' \
    'metrics/pageviews/per-article/cs.wikipedia.org' \
    '/all-access/all-agents/#page#/daily/#date_from#/#date_to#'

  class << self
    def download_data(page, date_from, date_to)
      # TODO
      # prepare URL and download data from last 7 days
      # for page: https://cs.wikipedia.org/wiki/Michal_David request looks like:
      # https://wikimedia.org/api/rest_v1/metrics/pageviews/per-article \
      #   /cs.wikipedia.org/all-access/all-agents/Michal_David/daily/20161001/20161007

      # url = prepare_url(CGI::escape(page), date_from, date_to)
      url = prepare_url(page, date_from, date_to)

      response = Typhoeus.get(url).body

      Oj.load(response, mode: :compat)
    end

    private

    def prepare_url(page, date_from, date_to)
      URL.sub("#page#", page).sub("#date_from#", date_from).sub("#date_to#", date_to)
    end
  end
end
