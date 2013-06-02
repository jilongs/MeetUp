class AddDateToMeets < ActiveRecord::Migration
  def change
    add_column :meets, :date, :datetime
  end
end
