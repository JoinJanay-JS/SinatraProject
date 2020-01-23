class Activities < ActiveRecord::Base
    has_many :titles
    belongs_to :students
  end