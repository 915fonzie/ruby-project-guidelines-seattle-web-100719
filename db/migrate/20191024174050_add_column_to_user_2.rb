class AddColumnToUser2 < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :current_score, :integer
  end
end
