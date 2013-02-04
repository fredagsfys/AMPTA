class Project < ActiveRecord::Base
  attr_accessible :name, :description, :start_date, :end_date, :user_id

  has_and_belongs_to_many :users
  
end
