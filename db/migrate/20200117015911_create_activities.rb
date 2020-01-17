class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activies do |t|
      t.string :title 
      t.string :image
      t.string :supplies
      t.text :instructions
      t.string :tags
    end
  end
end
