require 'sinatra/base'
require './lib/space'
require 'pg'
require './lib/user'

class BnB < Sinatra::Base
  enable :sessions

  get '/' do
    @user = User.find_by_id(session['user_id'])
    erb :index
  end

  get '/spaces' do
    @spaces = Space.all
    erb :'spaces/index'
  end

  get '/spaces/new' do
    erb :'spaces/new'
  end

  post '/spaces/new' do
    Space.create(name: params['name'], price: params['price'], description: params['description'])
    redirect '/spaces'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(
      first_name: params['first_name'],
      last_name: params['last_name'],
      password: params['password'],
      email: params['email']
    )
    session['user_id'] = user.id
    redirect '/'
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    Users.find_by_email([])
    redirect '/'
  end

end
