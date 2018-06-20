class ChangeStatusOnAssignments < ActiveRecord::Migration[5.2]
  def change
    remove_column :assignments, :status, :string
    add_column :assignments, :status, :integer, default: 0 
  end
end
