class UsersPokemons < ActiveRecord::Base
    belongs_to :user 
    belongs_to :pokemon 
end