class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :user_id
      t.string :username
      t.string :email
      t.string :password_digest
      t.string :student
      t.string :student_id
      t.timestamps null: false
    end
  end
end
