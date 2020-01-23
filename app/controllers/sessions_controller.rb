class SessionsController < ApplicationController

    get '/login' do
        redirect to '/login' if is_logged_in?
        erb :'users/index'
      end

    post '/login' do 
      if params["username"].empty? || params["password"].empty?
        @error = "Not so fast, Sneaky Teacher!"
        erb :'/login'
      else 
       if user= User.find_by(username: params["username"], password: params["password"] ) 
        session[:user_id] = user.id
        redirect '/students'

       else 
        @error = "No Sneaky Teacher Account Found"
       end 
    end 
end 
end 

