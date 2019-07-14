class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.integer :user_id, index: true, foreign_key: true
      t.string :title, null: false
      t.string :body
      t.datetime :completed_at

      t.timestamps
    end
  end
end
