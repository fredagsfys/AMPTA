class CreateUserProjectTable < ActiveRecord::Migration
  # Create without primary key
  def up
  	create_table :projects_users, :id => false do |t|
  	  t.integer :project_id
  	  t.integer :user_id
  	end
  	# Ad an index to the created table
  	add_index :projects_users, [:project_id, :user_id]
  end
  

  # Rollback
  def down
  	drop_table :projects_users
  end
end
