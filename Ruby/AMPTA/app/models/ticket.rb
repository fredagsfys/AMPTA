class Ticket < ActiveRecord::Base
  attr_accessible :name, :description, :project_id, :status_id, :user_id

	 belongs_to :project
	 belongs_to :status
	 belongs_to :user

end
