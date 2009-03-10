class AddGuestNumberEstimate < ActiveRecord::Migration
    def self.up
        add_column(:guests, :number_estimate, :integer)
    end

    def self.down
        remove_column(:guests, :number_estimate)
    end
end
