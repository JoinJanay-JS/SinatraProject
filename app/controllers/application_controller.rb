require './config/environment'

class ApplicationController < Sinatra::Base

  enable :sessions
  register Sinatra::Flash
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }
  set :public_folder, "public"

  get '/' do
   erb :welcome
  end


  helpers do
    def is_logged_in?
      !!current_user
    end

    def current_user
      User.find_by_id(session[:user_id]) || @user
    end
 
    def students
      Student.create(params[:name], params[:age], session[:user_id]) || @students
    end 

    def student 
      Student.find_by(params[:id], session[:user_id]) || @student
  end
end

end
