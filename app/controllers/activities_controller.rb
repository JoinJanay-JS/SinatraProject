class ActivitiesController < ApplicationController

    get '/activities' do 
        @activities = Activity.all.reverse
        erb '/activities/index'
    end 

    post '/activities' do 
        @activities = Activity.new(title: params["title"], supplies: params["supplies"], instructions: params["instructions"])
    end 
  
      get '/activities/:id' do
        @activities = Activity.find(params["id"])
        erb :"activities/show"
      end

end 