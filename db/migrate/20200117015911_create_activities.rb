class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :title 
      t.string :image
      t.string :supplies
      t.text :instructions
      t.string :tags
    end
  end
end
