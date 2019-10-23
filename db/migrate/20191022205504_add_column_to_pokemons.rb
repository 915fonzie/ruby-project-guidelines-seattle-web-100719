class AddColumnToPokemons < ActiveRecord::Migration[5.0]
  def change
    add_column :pokemons, :image, :string
  end
end
