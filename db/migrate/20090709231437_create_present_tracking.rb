class CreatePresentTracking < ActiveRecord::Migration
  def self.up
    change_table(:guests) do |t|
      t.text :present_description
    end
  end

  def self.down
    change_table(:guests) do |t|
      t.remove :present_description
    end
  end
end
