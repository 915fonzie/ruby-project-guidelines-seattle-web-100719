class CreatePokemons < ActiveRecord::Migration[4.2]
    def change
        create_table :pokemons do |t|
            t.string :name
        end
    end
end