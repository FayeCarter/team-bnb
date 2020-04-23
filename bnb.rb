require 'sinatra/base'
require './lib/space'
require 'pg'

class BnB < Sinatra::Base
  get '/' do
    redirect '/spaces'
  end

  get '/spaces' do
    @spaces = Space.all
    erb :'spaces/index'
  end

  get '/spaces/new' do
    erb :'spaces/new'
  end

  post '/spaces/new' do
    p params['description'] == ""
    Space.create(name: params['name'], description: params['description'])
    redirect '/spaces'
  end
end
