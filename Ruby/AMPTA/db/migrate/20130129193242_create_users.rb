class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|

    	t.string "FirstName", :limit => 20, :null => false
    	t.string "LastName", :limit => 20, :null => false
    	t.string "Email", :default => "", :null => false
    	t.string "Password", :limit => 40, :null => false

      t.timestamps
    end
  end
end
