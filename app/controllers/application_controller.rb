require './config/environment'

class ApplicationController < Sinatra::Base

  enable :sessions
  register Sinatra::Flash
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }
  set :public_folder, "public"

  get '/' do
    if is_logged_in?
      redirect to '/users'
    end 
   erb :welcome
  end

  helpers do
    def is_logged_in?
        !!session[:user_id]
    end

    def current_user
      User.find_by(session[:user_id])
    end
 
    def students
      students = Student.all
    end 

    def student 
     student= Student.find_by(params[:id], session[:user_id]) 
    end
  end
end 