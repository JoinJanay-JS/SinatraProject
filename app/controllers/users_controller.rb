class UsersController < ApplicationController
    get '/signup' do
      redirect to '/users' if is_logged_in?
      #go to users page and allow users to select student
      erb :'users/signup'
    end
  
    post '/signup' do
      user = Users.new(username: params["username"], email: params["email"], password: params["password"])
      if user.username.empty? || user.password.empty?
        @error = "Not so fast, Sneaky Teacher!"
        erb :'users/signup'
      elsif  
        Users.find_by(username: user.username) 
        @error = "Whoopsie! It looks like you're already a Sneaky Teacher. Please enter a new email or log in to continue." 
      else
        new_user= Users.create(username: params["username"], email: params["email"], password: params["password"])
        session[:user_id] = new_user.id   
        user.save 
        redirect '/users/show'
      end 
      end 

    get '/create/new' do 
      erb :'/users/student'
    end 

    post '/create' do 
      student = Students.new(name: params["name"], age: params["age"])
      if !student.name.empty? && student.age.empty?
        student.save
      else 
        @error = "Please create a new Student by adding a name and activity"
        erb :'/user/student'
    end 

    get '/student' do 
      @students = Students.all.reverse
      erb :'/users/index'
    end 

    get '/student/:id' do 
      @student = Students.find(params[id])
      erb :'/users/show'
    end 

    get '/logout' do
      if is_logged_in?
        session.clear
        redirect to '/login'
      else
        redirect to '/'
      end
    end
  end 
end 