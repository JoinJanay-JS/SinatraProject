class Activities < ActiveRecord::Base
    has_many :titles
    has_many :instructions
    has_many :supplies
    belongs_to :students
  end