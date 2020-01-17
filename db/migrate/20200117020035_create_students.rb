class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.integer :user_id
      t.string :name 
      t.integer :age 
      t.string :activities
      t.string :image
      end
  end
end
