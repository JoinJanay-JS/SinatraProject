require './config/environment'

class ApplicationController < Sinatra::Base

  enable :sessions
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }
  set :public_folder, "public"

  get '/' do
    if is_logged_in?
      redirect to '/users/login'
    end
    erb :welcome
  end

  helpers do
    def is_logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end

    def is_empty?(user_hash, route)
      user_hash.each do |att, val|
        if val.empty? 
          flash[:empty] = "Please complete all fields."
          redirect to '/#{route}'
        end
      end
    end

    get '/action_page.php' do
      "Thank you for the entry, Sneaky Teacher!"
    end


  end




end
