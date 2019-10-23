class RenameColumnPokemons < ActiveRecord::Migration[5.0]
  def change
    rename_column :pokemons, :image, :ascii
  end
end
