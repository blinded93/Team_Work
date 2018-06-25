class CreateAssignments < ActiveRecord::Migration[5.2]
  def change
    create_table :assignments do |t|
      t.string :name
      t.string :due_date
      t.boolean :status, default: false 
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
