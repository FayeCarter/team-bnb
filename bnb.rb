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
    result = conn.exec("INSERT INTO spaces (name) VALUES('#{params['name']}') RETURNING id, name;")
    id = result[0]['id']
    name = result[0]['name']
    "#{params['name']} has been listed"
  end

end
