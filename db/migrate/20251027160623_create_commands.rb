class CreateCommands < ActiveRecord::Migration[7.2]
  def change
    create_table :commands do |t|
      t.references :device, null: false, foreign_key: true
      t.string :command_type
      t.jsonb :payload
      t.string :status

      t.timestamps
    end
  end
end
