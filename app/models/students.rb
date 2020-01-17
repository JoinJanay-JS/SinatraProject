class Students < ActiveRecord::Base
    has_many :activies
    belongs_to :users
  end