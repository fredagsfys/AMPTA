class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|

    	t.string "status", :limit => 40

      t.timestamps
    end
  end
end
