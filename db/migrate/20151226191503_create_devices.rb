class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :identifier, null: false
      t.integer :truck_id, null: false
      t.boolean :enabled, default: true

      t.timestamps null: false
    end
  end
end
