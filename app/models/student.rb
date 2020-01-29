class Student < ActiveRecord::Base
    belongs_to :activities
    belongs_to :users
    validates :name, presence: true
    validates :age, presence: true


    def student_activities
      @student_activities = Student.activities.save 
    end 

  end