class CreateUserAssignments < ActiveRecord::Migration[5.2]
  def change
    create_table :user_assignments do |t|
      t.integer :user_id
      t.integer :assignment_id

      t.timestamps null: false 
    end
  end
end
