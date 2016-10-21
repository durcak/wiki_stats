require 'config/database'
require 'wiki_helper'
require 'database_helper'

require 'sinatra'
require 'slim'
require 'oj'

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
    # TODO
    # download data from wiki and show them in view
    # to download use WikiHelper.download_data
    # to fetch page name from DB use DatabaseHelper.get(params['id'])
    slim :refresh
  end

  post '/create' do
    # TODO
    # implement creating new row in DB with
    #  DatabaseHelper.create(params['page'])
    redirect '/'
  end

  delete '/:id' do
    # TODO
    # implement deleting from DB
    # use DatabaseHelper.delete(params['id'])
    redirect '/'
  end
end
