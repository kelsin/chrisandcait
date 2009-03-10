class CreateGuests < ActiveRecord::Migration
    def self.up
        create_table :guests do |t|
            t.integer "number"
            t.string "name"
            t.text "address"
            t.string "key"
            t.boolean "attending"
            t.timestamps
        end
    end

    def self.down
        drop_table :guests
    end
end
