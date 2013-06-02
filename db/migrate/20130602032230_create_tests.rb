class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.datetime :date

      t.timestamps
    end
  end
end
