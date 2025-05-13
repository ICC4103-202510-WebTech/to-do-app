class AddTasksTable < ActiveRecord::Migration[8.0]
  def change
    create_table :tasks do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.integer :status, null: false, default: 0
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
