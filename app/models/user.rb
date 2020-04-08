class User < ActiveRecord::Base
    has_many :students
    has_secure_password
    validates :email, presence: true, uniqueness: true
  end