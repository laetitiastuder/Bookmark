require 'sinatra/base'
require 'sinatra/reloader'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Hello World'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all_bookmarks
    erb :'bookmarks/index'
  end

  get '/bookmarks/new' do
    erb :"/bookmarks/new"
  end

  post '/bookmarks' do
    p params
    #prior refactoring
    # url = params['url'] # get the url from the submitted form data (params)
    # connection = PG.connect(dbname: 'bookmark_manager_test')
    # #execute SQL to insert a new bookmark to the table bookmarks column url
    # connection.exec("INSERT INTO bookmarks (url) VALUES ('#{url}')")
    #refactored
    Bookmark.create(url: params[:url])
    p params
    redirect '/bookmarks'
  end


  #do not delete the following line
  run! if app_file == $0
end