class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|

    	t.string "fname", :limit => 20
    	t.string "lname", :limit => 40
    	t.string "email", :default => "", :null => false

      t.timestamps
    end
  end
end
