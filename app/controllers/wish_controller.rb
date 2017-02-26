class WishController < ApplicationController

  get '/wishes' do
    if Helpers.is_logged_in?(session)
      @user = Helpers.current_user(session)
      @wishes = @user.wishes
      # binding.pry
      erb :'wishes/index'
    else
      redirect "/failure"
    end
  end

  get '/wishes/new' do
    if Helpers.is_logged_in?(session)
      erb :'wishes/new'
    else
      redirect "/failure"
    end
  end

  post '/wishes' do
    @wish = Wish.create(params)
    Helpers.current_user(session).wishes << @wish
    @wish.status = "Pending Assignment"
    @wish.build_time = rand(1..5)
    @wish.save
    binding.pry
    redirect "/wishes"
  end

  get '/wishes/:id' do
    @wish = Wish.find(params[:id])
    if Helpers.current_user(session).id == @wish.user_id
      erb :'/wishes/show'
    else
      redirect "/failure"
    end
  end

  get '/wishes/:id/delete' do
    @wish = Wish.find(params[:id])
    if Helpers.current_user(session).id == @wish.user_id
      erb :'/wishes/delete'
    else
      redirect "/failure"
    end
  end

end
