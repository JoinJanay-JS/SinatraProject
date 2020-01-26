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

  get '/users/index' do 
    erb :'/users/index'
  end 

  helpers do
    def is_logged_in?
      !!current_user
    end

    def current_user
      @user ||= User.find_by_id(session[:user_id])
    end



    get '/action_page.php' do
      "Thank you for the entry, Sneaky Teacher!"
    end

  end




end
