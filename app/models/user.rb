class User < ActiveRecord::Base
    has_many :students
    has_many :activities, through: :students
    has_secure_password
    validates :email, presence: true
  end