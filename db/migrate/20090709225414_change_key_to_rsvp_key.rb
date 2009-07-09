class ChangeKeyToRsvpKey < ActiveRecord::Migration
  def self.up
    change_table(:guests) do |t|
      t.rename :key, :rsvp_key
    end      
  end

  def self.down
    change_table(:guests) do |t|
      t.rename :rsvp_key, :key
    end      
  end
end
