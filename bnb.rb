require 'sinatra/base'

class BnB < Sinatra::Base

  get '/' do
    "Hello World!"
  end

  get '/spaces/new' do
    erb :'spaces/new'
  end

  post '/spaces/new' do
    "Cottage has been listed"
  end

end
