class Customer < ActiveRecord::Base
	has_many :sessions
	validates_presence_of :customer_id, :birthday, :email
  	validates_uniqueness_of :email 
  	has_secure_password
end
