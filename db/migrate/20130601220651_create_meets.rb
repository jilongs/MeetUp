class CreateMeets < ActiveRecord::Migration
  def change
    create_table :meets do |t|
      t.string :title
      t.string :content
      t.integer :user_id
      t.integer :city_id

      t.timestamps
    end
  end
end
