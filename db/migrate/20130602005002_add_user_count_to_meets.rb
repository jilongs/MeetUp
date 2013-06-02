class AddUserCountToMeets < ActiveRecord::Migration
  def change
    add_column :meets, :user_count, :integer
  end
end
