class AddTypeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :type, :string, limit: 15, null: false
  end
end
