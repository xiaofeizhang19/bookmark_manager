require 'sinatra/base'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :bookmarks
  end

  get '/new' do
    erb :new
  end

  post '/new' do
    Bookmark.add_new(params[:website], params[:title])
    redirect '/'
  end

  run! if app_file == $0
end
