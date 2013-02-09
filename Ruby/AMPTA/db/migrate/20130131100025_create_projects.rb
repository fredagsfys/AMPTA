class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
    	t.references :user

		  t.string :name, :limit => 40
		  t.text :description, :limit => 300
		  t.datetime :start_date, :null => true
		  t.datetime :end_date, :null => true

      t.timestamps
    end
    add_index(:projects, :user_id)
  end
end
