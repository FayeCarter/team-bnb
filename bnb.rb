require 'sinatra/base'

class BnB < Sinatra::Base

  get '/' do
    "Hello World!"
  end
  
end
