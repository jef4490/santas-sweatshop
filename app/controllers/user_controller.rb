class UserController < ApplicationController

  get '/users' do
    erb :'users/index'
  end

  get '/users/login' do
    erb :'users/login'
  end

  post '/users/login' do
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/dashboard"
    else
      redirect "/failure"
    end
  end

  get '/users/logout' do
    session.clear
    redirect "/"
  end

  get '/users/profile' do
    binding.pry
  end


end
