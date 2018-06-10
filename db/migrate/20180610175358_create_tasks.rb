class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :description
      t.references :assignment, index: true

      t.timestamps null: false
    end
  end
end
