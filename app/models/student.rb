class Student < ActiveRecord::Base
   # belongs_to :activities
    belongs_to :user
    validates :name, presence: true
    validates :age, presence: true

  end