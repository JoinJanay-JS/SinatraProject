class Activity < ActiveRecord::Base
    has_many :students


    def self.create_new_activity(title, supplies, image, instructions)
    (
      @title = title 
      @supplies = supplies
      @image = image
      @instructions = instructions 
      @students = Student.find(session[:id])

      

      @activities = Activity.new
    )
      @activities.update

    
      @activities.save
      @activities

    end 

    end 