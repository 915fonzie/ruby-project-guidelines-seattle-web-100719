class ChangeColumnTypeAscii < ActiveRecord::Migration[5.0]
  def change
    change_column :pokemons, :ascii, :string
  end
end
