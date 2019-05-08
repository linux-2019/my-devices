class CreateUpdates < ActiveRecord::Migration[5.2]
  def change
    create_table :updates do |t|
      t.string :ip_address
      t.integer :device_id

      t.timestamps
    end
  end
end
