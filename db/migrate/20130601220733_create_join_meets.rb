class CreateJoinMeets < ActiveRecord::Migration
  def change
    create_table :join_meets do |t|
      t.integer :meet_id
      t.integer :user_id

      t.timestamps
    end
  end
end
