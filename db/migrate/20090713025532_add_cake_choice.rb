class AddCakeChoice < ActiveRecord::Migration
  def self.up
    change_table(:guests) do |t|
      t.integer :num_carrot, :num_chocolate, :num_cheese, :num_vanilla, :null => false, :default => 0
    end
  end

  def self.down
    change_table(:guests) do |t|
      t.remove :num_carrot, :num_chocolate, :num_cheese, :num_vanilla
    end
  end
end
