class Activity < ActiveRecord::Base
    has_many :students


    def self.create_new_activity(title, supplies, image, instructions)
      @title = title 
      @supplies = supplies
      @image = image
      @instructions = instructions 
      @students = Student.find(session[:id])

      set_student_activity

      @activities = Activity.new(
        :title => @title[:title]
        :supplies => @supplies[:supplies]
        :instructions => @instuctions[:instuctions]
      )

      @activities.students = @student_activities

      @activities.save
      @activities

    end 

    end 


  end