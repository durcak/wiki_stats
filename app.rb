require 'config/database'
require 'wiki_helper'
require 'database_helper'

require 'sinatra'
require 'slim'
require 'oj'
require 'cgi'

class WikiStats < Sinatra::Base
  include WikiHelper
  include DatabaseHelper
  set :method_override, true

  before do
    @name = "Tomas Hrabal"
  end

  get '/' do
    # fetch rows from database
    @pages = DatabaseHelper.all_pages
    # HTML
    slim :app
  end

  get '/refresh/:id' do
    page = DatabaseHelper.get(params['id'])
    time_from = Time.at(Time.now - (7 * 86_400)).strftime('%Y%m%d')
    time_to = Time.now.strftime('%Y%m%d')

    @data = WikiHelper.download_data(escape(page), time_from, time_to)

    slim :refresh
  end

  post '/create' do
    DatabaseHelper.create(params["page"])

    redirect '/'
  end

  delete '/:id' do
    DatabaseHelper.delete(params['id'])

    redirect '/'
  end
end
