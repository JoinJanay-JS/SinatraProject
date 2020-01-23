class ActivitiesController < ApplicationController

    get '/activities' do 
        activities = Activities.new(title: params["title"], supplies: params["supplies"], instructions: params["instructions"])
    end 

    post '/activities' do 
    end 

end 