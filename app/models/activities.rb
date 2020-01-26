class Activities < ActiveRecord::Base
    has_many :titles
    has :instructions
    has_many :supplies
    belongs_to :students
  end