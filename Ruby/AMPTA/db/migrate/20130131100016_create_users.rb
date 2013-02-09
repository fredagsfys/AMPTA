class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|

    	t.string :first_name, :limit => 20
    	t.string :last_name, :limit => 40
    	t.string :email, :default => "", :null => false, :limit => 200
    	t.string :password, :limit => 40
      t.string :password_hash
      t.string :password_salt

      t.timestamps
    end
  end
end
