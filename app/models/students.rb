class Students < ActiveRecord::Base
    has_many :activities
    has_many :titles through: :activities
    belongs_to :users
  end