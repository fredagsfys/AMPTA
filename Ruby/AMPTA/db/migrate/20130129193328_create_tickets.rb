class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
    	t.references :User
    	t.references :Project
    	t.references :Status

    	t.string "Name", :limit => 20, :null => false
    	t.string "Description", :limit => 100, :null => false

      t.timestamps
    end
  end
end
