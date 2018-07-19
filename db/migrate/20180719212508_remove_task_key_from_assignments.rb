class RemoveTaskKeyFromAssignments < ActiveRecord::Migration[5.2]
  def change
    remove_column :assignments, :task_id, :integer 
  end
end
