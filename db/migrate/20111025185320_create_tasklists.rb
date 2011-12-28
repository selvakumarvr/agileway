class CreateTasklists < ActiveRecord::Migration
  def change
    create_table :tasklists do |t|

	  t.string :title
	  t.string :status
      t.timestamps
	  t.integer :user_id
	  
    end
  end
end
