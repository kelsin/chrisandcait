class AddGuestNumberNullness < ActiveRecord::Migration
    def self.up
        change_column(:guests, :number, :integer, :null => true)
        change_column(:guests, :number_estimate, :integer, :null => true)
    end

    def self.down
        change_column(:guests, :number, :integer, :null => false)
        change_column(:guests, :number_estimate, :integer, :null => false)
    end
end
