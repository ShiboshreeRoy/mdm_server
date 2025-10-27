class CreateEnterprises < ActiveRecord::Migration[7.2]
  def change
    create_table :enterprises do |t|
      t.string :provider
      t.string :name
      t.jsonb :credentials

      t.timestamps
    end
  end
end
