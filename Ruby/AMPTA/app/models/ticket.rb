class Ticket < ActiveRecord::Base
	attr_accessible :name, :description, :project_id, :status_id, :user_id

	 belongs_to :project
	 belongs_to :status
	 belongs_to :user

 	validates :name,
	          :presence => {:msg => "Pleae, enter a name for your ticket."},
	          :length => {:minimum => 2, :msg => "The name must contain at least 2 characters, max 40."}

	validates :description,
	          :presence => {:msg => "Pleae, enter a description for your ticket."},
	          :length => {:minimum => 2, :msg => "The description must contain at least 2 characters, max 40."}

end
