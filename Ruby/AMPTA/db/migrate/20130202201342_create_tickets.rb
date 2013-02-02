class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|

    	t.references :project_id
    	t.references :status_id
    	t.references :user_id

    	t.string "name", :limit => 40
    	t.string "description", :limit => 150

      t.timestamps
    end
  end
end
