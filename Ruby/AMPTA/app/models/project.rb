class Project < ActiveRecord::Base
  	attr_accessible :name, :description, :start_date, :end_date, :user_id

  	has_and_belongs_to_many :users
  	has_many :tickets, :dependent => :delete_all

  	 def self.search(query)
	  if query
	   where('name LIKE ?', "%#{query}%")
	  else
	   all
	  end
	 end

  	validates :name,
	          :presence => {:msg => "Please, enter a name to your project."},
	          :length => {:minimum => 2, :msg => "The name must contain at least 2 characters, max 40."}

	validates :description,
	          :presence => {:msg => "Please, enter a description to your project."},
	          :length => {:minimum => 2, :msg => "The description must contain at least 2 characters, max 40."}
  
end
