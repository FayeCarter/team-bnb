require 'sinatra/base'
require 'PG'

class BnB < Sinatra::Base

  get '/' do
    "Hello World!"
  end

  get '/spaces/new' do
    erb :'spaces/new'
  end

  post '/spaces/new' do
    conn = PG.connect(dbname: 'bnb_test')
    result = Space.create(name: params['name'])
    "#{result.name} has been listed"
  end

end
