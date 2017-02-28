class UserController < ApplicationController

  get '/users' do
    erb :'users/index'
  end

  get '/users/dashboard' do
    redirect "/users/login" if !Helpers.is_logged_in?(session)
    @wishes = Helpers.current_user(session).wishes
    @wishes_all = Wish.all
    erb :'users/dashboard'
  end

  get '/users/login' do
    if Helpers.is_logged_in?(session)
      redirect "/users/dashboard"
    else
      erb :'users/login'
    end
  end

  post '/users/login' do
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/users/dashboard"
    else
      redirect "/failure"
    end
  end

  get '/users/logout' do
    session.clear
    redirect "/"
  end

  get '/users/profile' do
    if Helpers.is_logged_in?(session)
      @user = Helpers.current_user(session)
      redirect "/users/#{@user.id}/profile"
    end
  end

  get '/users/:id/profile' do
    redirect "/users/login" if !Helpers.is_logged_in?(session)
    @user = User.find(params[:id])
    erb :'/users/show'
  end

  get '/failure' do
    erb :failure
  end

end
