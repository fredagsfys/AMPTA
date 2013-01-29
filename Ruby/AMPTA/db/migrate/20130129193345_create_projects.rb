class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|

    	t.string "Name", :limit => 50, :null => false
    	t.string "Description", :limit => 200
    	t.timestamps "Start_Date", :null => false
    	t.timestamps "End_Date", :null => true
    	
      t.timestamps
    end
  end
end
