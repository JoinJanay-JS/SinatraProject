class UsersController < ApplicationController

  get '/signup' do
    redirect to '/users' if is_logged_in?
    #go to users page and allow users to select student
    erb :'users/signup'
  end

  post '/signup' do
    user = User.new(username: params["username"], email: params["email"], password: params["password"])
    if user.save
      session[:user_id] = user.id    
      redirect '/users'  
    else
      user = User.find_by(username: params["username"]) 
      @error = "Whoopsie! It looks like you're already a Sneaky Teacher. Please enter a new email or log in to continue." 
      erb :'users/signup'
    end 
  end 

  get '/login' do
    if !is_logged_in?
      redirect to '/users'
      erb :'/users/index'
    end 
  end 

  get '/users' do 
    erb :'/users/index'
  end

  post '/users' do
  end

get '/users/show' do 
  redirect to :'users/show'
end 



end 
