class Users < ActiveRecord::Base
    has_many :users_pokemons
    has_many :pokemons, through: :users_pokemons
end