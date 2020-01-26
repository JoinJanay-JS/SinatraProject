class Students < ActiveRecord::Base
    has_many :activities
    belongs_to :users
  end