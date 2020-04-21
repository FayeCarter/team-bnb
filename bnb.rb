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
end
