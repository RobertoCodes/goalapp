class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :name, null: false
      t.integer :user_id, null: false, index: true
      t.boolean :private, default: true
      t.boolean :completed, default: false
      t.timestamps
    end
  end
end
