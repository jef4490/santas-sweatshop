require "./config/environment.rb"
class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  configure do
    set :views, "app/views"
    enable :sessions
    set :session_secret, "password_security"
  end

  get "/" do
    erb :index
  end

  get '/register' do
    erb :'register'
  end

  post '/register' do
    user = User.new(params)
    if user.save
      redirect "/users/login"
    else
      redirect "/failure"
    end
  end

end
