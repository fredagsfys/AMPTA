class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
    	t.references :project
    	t.references :status
    	t.references :user

    	t.string :name, :limit => 40
    	t.string :description, :limit => 300

      t.timestamps
    end
    add_index(:tickets, [:project_id, :status_id, :user_id])
  end
end
