class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.point :coordinates
      t.integer :device_id
      t.datetime :taken_at

      t.timestamps null: false
    end
  end
end
