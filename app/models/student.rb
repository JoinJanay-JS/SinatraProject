class Student < ActiveRecord::Base
    belongs_to :activities
    belongs_to :users
  end