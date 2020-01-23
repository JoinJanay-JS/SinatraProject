class Users < ActiveRecord::Base
    has_many :students
    has_many :titles, through: :students
    has_secure_password
  end