class UsersController < ApplicationController

  get '/signup' do
    erb :'users/signup'
  end

  post '/users' do
    #@user = User.all()
      user = User.create(username: params["username"], email: params["email"], password: params["password"]  )
      if user.valid?
      session[:user_id] = user.id 
      redirect to '/users/#{@user.id}'
    # if new_user = User.find_by(username: params["username"]) 
    #  @error = "Whoopsie! It looks like you're already a Sneaky Teacher. Please enter a new email or log in to continue." 
    #  erb :'users/login'
   end 
  end 

  get '/users/:id' do 
    if user.is_logged_in? && User.find_by
    @user = User.find_by(id: params[:id])
    @students = @user.students
    else
      redirect to '/' 
    end
   erb :'/users/index'
  end

 # post '/users' do 
   # if student.create
      #redirect to :'/users/show'
   # end 
 # end

  get '/users/all_students' do 
    redirect to :'/students'
  end 

    get '/users/:id/students' do 
        @user = User.find_by(id: params["id"])
        @students = @user.students
        erb :'/users/show'
    end 
  end