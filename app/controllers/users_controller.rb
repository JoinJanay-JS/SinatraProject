class UsersController < ApplicationController

  get '/signup' do
    erb :'users/signup'
  end

  post '/signup' do
    user = User.all()
      new_user = User.create(username: params["username"], email: params["email"], password: params["password"]  )
      session[:user_id] = new_user.id 
      redirect '/users'  
     if new_user = User.find_by(username: params["username"]) 
      @error = "Whoopsie! It looks like you're already a Sneaky Teacher. Please enter a new email or log in to continue." 
      erb :'users/signup'
    end 
  end 

  get '/users' do 
    erb :'/users/index'
  end

  post '/users' do 
    if student.create
      #redirect to :'/users/show'
    end 
  end

get '/users/all_students' do 
  redirect to :'/students'
end 

    get '/users/:id/students' - 
        @user = User.find_by(id: params["id"])
        @students = @user.students
        erb :'/users/show'
    end 
end 
