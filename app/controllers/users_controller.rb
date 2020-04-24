class UsersController < ApplicationController

  get '/users' do
    if is_logged_in?
      @users = User.all
    else
      redirect to '/'
    end
    erb :'users/index'
  end

  get '/signup' do
    erb :'users/signup'
  end

  post '/users' do
    user = User.create(username: params["username"], email: params["email"], password: params["password"]  )
      if user.valid?
      session[:user_id] = user.id 
      redirect to "/users/#{user.id}"
      end 
  end 

  get '/users/:id' do 
    if is_logged_in? && User.find_by(id: params[:id])
    
    @user = User.find_by(id: params[:id])
    @students = @user.students
    else
      redirect to '/' 
    end
   erb :'/users/show'
    end
    
  end