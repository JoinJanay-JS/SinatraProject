class UsersController < ApplicationController
    get '/signup' do
      redirect to '/students' if is_logged_in?
      #go to users page and allow users to select student
      erb :"users/signup"
    end
  
    post '/signup' do
      user= User.new(params)
      if user.username.empty? || user.password.empty?
        @error = "Not so fast, Sneaky Teacher!"
        erb :'user/signup'
      elsif  
        User.find_by(username: user.username) 
        @error = "Whoopsie! It looks like you're already a Sneaky Teacher. Please enter a new email or log in to continue." 
      else   
        user.save 
        session[:user_id] = user.id
        redirect '/users'
      end 
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
  
end 