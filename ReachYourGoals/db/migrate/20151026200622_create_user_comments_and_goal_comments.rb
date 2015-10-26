class CreateUserCommentsAndGoalComments < ActiveRecord::Migration
  def change
    create_table :user_comments do |t|
      t.string :body, null:false
      t.integer :author_id, null:false
      t.integer :recipient_id, null:false

      t.timestamps
    end

    create_table :goal_comments do |t|
      t.string :body, null:false
      t.integer :author_id, null:false
      t.integer :goal_id, null:false

      t.timestamps
    end
  end
end
