class AddRsvpNote < ActiveRecord::Migration
  def self.up
    change_table(:guests) do |t|
      t.text :rsvp_note
      t.datetime :rsvp_on
    end
  end

  def self.down
    change_table(:guests) do |t|
      t.remove :rsvp_note, :rsvp_on
    end
  end
end
