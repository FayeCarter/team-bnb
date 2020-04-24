require 'sinatra/base'
require './lib/space'

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
    Space.create(
      name: params['name'],
      price: params['price'],
      description: params['description'],
      start_date: params['start-date'],
      end_date: params['end-date']
    )
    redirect '/spaces'
  end
end
