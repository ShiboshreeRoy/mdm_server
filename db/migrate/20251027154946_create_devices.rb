class CreateDevices < ActiveRecord::Migration[7.2]
  def change
    create_table :devices do |t|
      t.references :enterprise, null: false, foreign_key: true
      t.string :device_id
      t.string :platform
      t.boolean :enrolled
      t.datetime :last_seen
      t.jsonb :metadata

      t.timestamps
    end
  end
end
