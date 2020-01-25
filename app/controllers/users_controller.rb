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

      get '/login' do
        redirect to '/students' if is_logged_in?
    
        erb :"users/logged_in"
      end

      post '/login' do
        user_info = {
          :email => params["email"],
          :password => params["password"]
        }
    
        is_empty?(user_info, 'login')
    
        user = Users.find_by(:email => user_info[:email])
    
        if user && user.authenticate(user_info[:password])
          session[:user_id] = user.id
          redirect to '/users/logged_in'
        else
          if user
            flash[:password] = "Your password is incorrect"
            redirect to '/login'
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
end 