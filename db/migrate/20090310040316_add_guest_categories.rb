class AddGuestCategories < ActiveRecord::Migration
    def self.up
        change_table :guests do |t|
            t.references :categories
        end
    end

    def self.down
    end
end
