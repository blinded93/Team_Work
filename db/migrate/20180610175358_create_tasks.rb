class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name
      t.datetime :completed_at
      t.integer :assignment_id

      t.timestamps null: false
    end
  end
end
