class AssociateProjectAndTaskWithuser < ActiveRecord::Migration[8.0]
  def change
    change_table :projects do |t|
      t.references :user, foreign_key: true
    end

    change_table :tasks do |t|
      t.references :user, foreign_key: true
    end
  end
end
