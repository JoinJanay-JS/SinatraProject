class UsersController < ApplicationController
    get '/signup' do
      redirect to '/students' if is_logged_in?
      #go to users page and allow users to select student
      erb :"users/signup"
    end
  
    post '/signup' do
      user_info = { :username => params["username"],
                    :email => params["email"],
                    :password => params["password"] }
  
      is_empty?(user_info, 'signup')
      flash[:account_taken] = "Not so fast, Sneaky Teacher!"
      redirect to '/signup'
  
      if User.find_by(:email => user_info[:email])
        flash[:account_taken] = "Whoopsie! It looks like you're already a Sneaky Teacher. Please enter a new email or log in to continue."
        redirect to '/signup'
      end
  
     if new_user = User.create(user_info)
      session[:user_id] = new_user.id
  
      redirect to '/students'
    end
  
    get '/login' do
      redirect to '/users' if is_logged_in?
  
      erb :'users/login'
    end
  
    post '/login' do
      user_info = {
        :email => params["email"],
        :password => params["password"]
      }
  
      is_empty?(user_info, 'login')
      redirect to '/login'
  
      user = User.find_by(:email => user_info[:email])
  
      if user && user.authenticate(user_info[:password])
        session[:user_id] = user.id
        redirect to '/users'
      else
        if user
          flash[:password] = "Your password is incorrect"
          redirect to '/login'
        else
          flash[:no_account] = "Uh oh! Not so fast, you're not a Sneaky Teacher quite yet! Please enter a different email or sign up for an account."
          redirect to '/login'
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