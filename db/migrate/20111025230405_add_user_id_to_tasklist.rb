class AddUserIdToTasklist < ActiveRecord::Migration
  def change
    add_column :tasklists, :user_id, :integer
  end
end
