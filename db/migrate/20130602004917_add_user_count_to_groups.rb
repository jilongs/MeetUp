class AddUserCountToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :user_count, :integer
  end
end
