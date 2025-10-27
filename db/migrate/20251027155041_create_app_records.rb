class CreateAppRecords < ActiveRecord::Migration[7.2]
  def change
    create_table :app_records do |t|
      t.references :enterprise, null: false, foreign_key: true
      t.string :package_name
      t.string :title
      t.boolean :managed

      t.timestamps
    end
  end
end
