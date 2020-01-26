class Users < ActiveRecord::Base
    has_one :username
    has_many :students
    has_many :activities, through: :students
    has_many :titles, through: :activities
    has_secure_password
  end