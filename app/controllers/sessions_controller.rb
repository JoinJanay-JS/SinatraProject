class SessionsController < ApplicationController
 
  get '/login' do
    redirect to '/users' if is_logged_in?
   erb :"users/login"
  end

 post '/login' do
   user = User.find_by(email: params["email"])

   if user && user.authenticate(params[:password])
     session[:user_id] = user.id
     redirect to '/students'
   else
       flash[:message] = "Your password is incorrect"
       redirect to '/login'
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
