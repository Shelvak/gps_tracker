class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.point :coordinates, null: false
      t.integer :device_id, null:false
      t.datetime :taken_at, null: false

      t.timestamps null: false
    end
  end
end
