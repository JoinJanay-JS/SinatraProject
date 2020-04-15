class UsersController < ApplicationController

  get '/signup' do
    erb :'users/signup'
  end

  post '/users' do
      user = User.create(username: params["username"], email: params["email"], password: params["password"]  )
      if user.valid?
      session[:user_id] = user.id 
      redirect to "/users/#{user.id}"
    # if new_user = User.find_by(username: params["username"]) 
    #  @error = "Whoopsie! It looks like you're already a Sneaky Teacher. Please enter a new email or log in to continue." 
    #  erb :'users/login'
   end 
  end 

  get '/users' do
    if is_logged_in?
      @users = User.all
    else
      redirect to '/'
    end
    erb :'users/index'
  end

  get '/users/:id' do 
    user = User.create(username: params["username"], email: params["email"], password: params["password"]  )
    if is_logged_in? && User.find_by(id: params[:id])
    @user = User.find_by(id: params[:id])
    @students = @user.students
    else
      redirect to '/' 
    end
   erb :'/users/show'
  end

    get '/users/:id/students' do 
        @user = User.find_by(id: params["id"])
        @students = @user.students
        erb :'/users/index'
    end 
  end