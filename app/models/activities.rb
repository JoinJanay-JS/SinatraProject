class Activities < ActiveRecord::Base
    has_many :tags
    belongs_to :students
  end