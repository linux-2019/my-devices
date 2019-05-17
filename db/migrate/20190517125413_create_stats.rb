class CreateStats < ActiveRecord::Migration[5.2]
  def change
    create_table :stats do |t|
      t.integer :device_id
      t.string :disk_free
      t.string :disk_total
      t.string :memory_free
      t.string :memory_total
      t.string :uptime
      t.string :hostname
      t.string :kernel

      t.timestamps
    end
  end
end
