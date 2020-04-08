class UsersController < ApplicationController

  get '/signup' do
    erb :'users/signup'
  end

  post '/users' do
    #@user = User.all()
      new_user = User.create(username: params["username"], email: params["email"], password: params["password"]  )
      if new_user.valid?
      session[:user_id] = new_user.id 
      redirect to "/users/#{@new_user.id}"  
    # if new_user = User.find_by(username: params["username"]) 
    #  @error = "Whoopsie! It looks like you're already a Sneaky Teacher. Please enter a new email or log in to continue." 
    #  erb :'users/login'
   end 
  end 

  get '/users/:id' do 
    @new_user = User.find_by(id: params[:id])
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
        @new_user = User.find_by(id: params["id"])
        @students = @new_user.students
        erb :'/users/show'
    end 
  end