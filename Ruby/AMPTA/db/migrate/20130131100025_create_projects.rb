class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
    	t.references :user

		  t.string :name, :limit => 40, :null => false
		  t.text :description, :limit => 300
		  t.datetime :start_date, :null => false
		  t.datetime :end_date, :null => false

      t.timestamps
    end
    add_index(:projects, :user_id)
  end
end
