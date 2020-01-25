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

    get '/users/' do 
      erb :'/students/login'
    end 

    post '/users/' do
      student = Students.new(name: params["name"], age: params["age"])
      if !student.name.empty? && student.age.empty?
        student.save
      else 
      new_student= Students.create(name: params["name"], age: params["age"], image: params["image"])
        session[:student_id] = new_student.id   
        student.save 
        redirect '/students/show'
    end

    post '/create' do 
      student = Students.new(name: params["name"], age: params["age"])
      if !student.name.empty? && student.age.empty?
        student.save
      elsif
        @error = "Please create a new Student by adding a name and activity"
      else 
        new_student= Students.create(name: params["name"], age: params["age"], image: params["image"])
        session[:student_id] = new_student.id   
        student.save 
        redirect '/students/show'
    end 


  get '/users/show' do 
    redirect to :'users/show'
  end 

  post '/users/login' do 
    erb :'/users/test'
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
end 
