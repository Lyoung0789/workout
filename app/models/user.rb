class User < ActiveRecord::Base
    has_secure_password 
    validates :email, uniqueness: true 
    validates :email, presence: true
    validates :password, presence: true
    validates :username, presence: true 
    validates :username, uniqueness: true
    has_many :exercises
end 


