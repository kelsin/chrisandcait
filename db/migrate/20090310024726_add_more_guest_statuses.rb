class AddMoreGuestStatuses < ActiveRecord::Migration
    def self.up
        add_column(:guests, :sent_thank_you, :boolean)
        add_column(:guests, :bride, :boolean)
    end

    def self.down
    end
end
