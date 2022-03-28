require 'sinatra/base'
require './lib/bookmark.rb'

class Bookmark < Sinatra::Base

  get '/test' do
    'test page'
  end

  #Do not modify the line above
  run! if app_file == $0
end