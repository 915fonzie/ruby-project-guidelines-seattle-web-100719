class CreateUsersPokemons < ActiveRecord::Migration[4.2]
    def change
        create_table :users_pokemons do |t|
            t.integer :user_id
            t.integer :pokemon_id
        end
    end
end