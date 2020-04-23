require 'sinatra/base'
require './lib/space'
require 'pg'

class BnB < Sinatra::Base
  get '/' do
    "Hello World!"
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
    conn = PG.connect(dbname: 'bnb_test')
    result = Space.create(name: params['name'], price: params['price'])
    redirect '/spaces'
  end
end
