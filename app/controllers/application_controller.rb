require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'secret'
  end

  get "/" do
    erb :welcome
  end

  get "/signup" do
    erb :signup
  end

  get "/login" do
    erb :login
  end

  post "/signup" do
    user = User.create(params)
    session[:user_id] = user.id
    redirect '/'
  end

  post "/login" do
    user = User.find_by(username: params[username])
    session[:user_id] = user.id
    erb :homepage
  end
end
