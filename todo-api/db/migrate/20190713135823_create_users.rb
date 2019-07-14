class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :username, null: false
      t.string :password_digest
      t.string :token, index: true, unique: true
      t.datetime :token_expired_at

      t.timestamps
    end
  end
end
