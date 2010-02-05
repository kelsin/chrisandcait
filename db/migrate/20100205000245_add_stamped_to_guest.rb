class AddStampedToGuest < ActiveRecord::Migration
  def self.up
    change_table(:guests) do |t|
      t.boolean :stamped_p
    end
  end

  def self.down
    change_table(:guests) do |t|
      t.remove :stamped_p
    end
  end
end
