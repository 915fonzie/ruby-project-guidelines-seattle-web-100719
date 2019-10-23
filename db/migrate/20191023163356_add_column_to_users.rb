class AddColumnToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :tries_left, :integer
  end
end
