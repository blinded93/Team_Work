class AddStatusToAssignments < ActiveRecord::Migration[5.2]
  def change
    add_column :assignments, :status, :string, default: "pending"
  end
end
