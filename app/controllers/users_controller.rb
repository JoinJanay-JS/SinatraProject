class UsersController < ApplicationController
    get '/signup' do
      redirect to '/users' if is_logged_in?
      #go to users page and allow users to select student
      erb :"users/signup"
    end
  
    post '/signup' do
      user = Users.new(username: params["username"], email: params["email"], password: params["password"])
      if users.username.empty? || users.password.empty?
        @error = "Not so fast, Sneaky Teacher!"
        erb :'user/signup'
      elsif  
        Users.find_by(username: user.username) 
        @error = "Whoopsie! It looks like you're already a Sneaky Teacher. Please enter a new email or log in to continue." 
      else
        new_user= User.create(user)
        session[:user_id] = new_user.id   
        users.save 
        redirect '/users'
      end 
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