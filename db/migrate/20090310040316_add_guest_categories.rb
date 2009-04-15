class AddGuestCategories < ActiveRecord::Migration
    def self.up
        change_table :guests do |t|
            t.references :category
        end
    end

    def self.down
        remove_column(:guests, :category_id)
    end
end
