class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :login
      t.string :password
      t.string :name
      t.string :email

      t.timestamps
	  
	  
	add_column :task, :user_id, :integer
	add_column :tasklists, :user_id, :integer
    end
  end
end
