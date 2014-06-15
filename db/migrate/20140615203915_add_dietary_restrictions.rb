class AddDietaryRestrictions < ActiveRecord::Migration
  def self.up
    change_table(:guests) do |t|
      t.string :dietary_restrictions
    end
  end

  def self.down
    change_table(:guests) do |t|
      t.remove :dietary_restrictions
    end
  end
end
