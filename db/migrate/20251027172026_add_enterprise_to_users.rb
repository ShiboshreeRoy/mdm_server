class AddEnterpriseToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :enterprise, null: true, foreign_key: true
  end
end
