class Category < ActiveRecord::Base
  has_many :guests
  
  def number
    guests.inject(0) do |sum, guest|
      sum + guest.number_display
    end
  end
  
  def self.number
    find(:all).inject(0) do |sum, category|
      sum + category.number
    end
  end
end
