class ActivitiesController < ApplicationController

    get '/activities' do 
        @activities = Activities.all.reverse
        erb '/activities/index'
    end 

    post '/activities' do 
        activities = Activities.new(title: params["title"], supplies: params["supplies"], instructions: params["instructions"])
    end 
  
      get '/activities/:id' do
        @activities = Activities.find(params["id"])
        erb :"activities/show"
      end

end 