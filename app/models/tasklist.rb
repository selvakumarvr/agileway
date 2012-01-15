class Tasklist < ActiveRecord::Base
 has_many :tasks,  :conditions => 'Status != "C"'
 
 has_many :todo_tasks, :class_name => "Task",
    :conditions => 'next_action == true'
 
 has_many :completed_task, :class_name => "Task",
    :conditions => 'Status == "C"'
 
 

end
