class CorrectUserTable < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :goals_count, :integer, :null => false, :default => 0
    remove_column :users, :goals_completed_count, :integer, :null => false, :default =>0
    add_column :users, :assignments_count, :integer, :null => false, :default => 0
    add_column :users, :assignments_completed_count, :integer, :null => false, :default => 0
  end
end
