class User < ActiveRecord::Base
	attr_accessible :fname, :lname, :email, :password

	has_and_belongs_to_many :projects
	has_many :ticket
end
