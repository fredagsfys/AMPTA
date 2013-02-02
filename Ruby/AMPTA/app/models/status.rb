class Status < ActiveRecord::Base
	attr_accessible :status
	has_many :ticket
end
