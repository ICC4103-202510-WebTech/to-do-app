class AddProjectsTable < ActiveRecord::Migration[8.0]
  def change
    create_table :projects do |t|
      t.string :name, null: false
      t.timestamps
    end
  end
end
