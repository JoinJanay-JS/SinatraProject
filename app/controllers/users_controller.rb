class UsersController < ApplicationController

    get '/signup' do
      redirect to '/users' if is_logged_in?
      #go to users page and allow users to select student
      erb :'users/signup'
    end
  
    post '/signup' do
      user = User.new(username: params["username"], email: params["email"], password: params["password"])
      if user.save
        session[:user_id] = user.id    
        redirect '/students'  
      elsif  
        user = User.find_by(username: params["username"]) 
        @error = "Whoopsie! It looks like you're already a Sneaky Teacher. Please enter a new email or log in to continue." 
      else
        @error = "Not so fast, Sneaky Teacher!"
        erb :'users/signup'
  
      end 
      end 


    get '/users' do 
      erb :'/users/logged_in'
    end


    get '/users/:id' do 
    end 

    post '/users/:id' do 

    end 
  


  get '/users/show' do 
    redirect to :'users/show'
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
