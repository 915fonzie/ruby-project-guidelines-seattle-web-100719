class CreateUsers < ActiveRecord::Migration[4.2]
    def change
        create_table :users do |t|
            t.string :first_name
            t.string :last_name
            t.integer :high_score
        end
    end
end