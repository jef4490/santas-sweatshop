class WishController < ApplicationController

  get '/wishes' do
    erb :'wishes/index'
  end

end
