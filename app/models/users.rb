class User < ActiveRecord::Base
    has_many :students
    has_many :tags, through: :students
    has_secure_password
  end