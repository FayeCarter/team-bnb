require 'sinatra/base'
require './lib/space'
require 'pg'

class BnB < Sinatra::Base

  get '/' do
    "Hello World!"
    redirect '/view_spaces'
  end

  get '/view_spaces' do
    @spaces = Space.all
    erb :view_spaces
  end
end
