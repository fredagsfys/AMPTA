class User < ActiveRecord::Base
	attr_accessible :fname, :lname, :email

	has_many :ticket
	has_and_belongs_to_many :project
end
