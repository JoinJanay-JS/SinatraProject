class Student < ActiveRecord::Base
    belongs_to :activities
    belongs_to :users
    validates :name, presence: true
    validates :age, presence: true

  end