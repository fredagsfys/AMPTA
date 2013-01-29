class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|

    	t.string "Status", :limit => 40

      t.timestamps
    end
  end
end
