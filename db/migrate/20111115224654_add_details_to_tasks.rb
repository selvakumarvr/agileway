class AddDetailsToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :next_action, :boolean
    add_column :tasks, :priority, :integer
  end
end
