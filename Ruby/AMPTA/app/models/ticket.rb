class Ticket < ActiveRecord::Base
  attr_accessible :name, :description

	 belongs_to :project
	 belongs_to :status
	 belongs_to :user

end
