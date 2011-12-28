class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :notes
      t.datetime :effective_at
      t.datetime :duedate_at
      t.string :status
	 t.timestamps
	  t.references :tasklist
    end
  end
end
