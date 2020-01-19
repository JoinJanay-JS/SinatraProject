class SessionsController < ApplicationsController

    get '/login' do
        redirect to '/users' if is_logged_in?
        erb :'users/show'
      end

    post '/login' do 
        
        
      if params["username"].empty? || params["password"].empty?
        @error = "Not so fast, Sneaky Teacher!"
        erb :'users/login'

        user= User.find(username: params["username"], password: params["password"] ) 
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