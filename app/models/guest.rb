class Guest < ActiveRecord::Base
  belongs_to :category
  default_scope :order => "guests.name"
  named_scope :chris, :conditions => { :bride => false }
  named_scope :cait, :conditions => { :bride => true }
  
  before_save :empty_rsvp_keys_to_nil

  def side
    if bride
      "Bride"
    else
      "Groom"
    end
  end
  
  def number_display
    number || number_estimate || 0
  end
  
  def number_actual_display
    number || 0
  end
  
  def number_estimate_display
    number_estimate || 0
  end

  def cake_numbers_valid?
    (self.num_carrot + self.num_chocolate + self.num_vanilla + self.num_cheese) == self.number
  end

  def name_check_valid?(str)
    return false if str.blank? || str.length <= 3

    self.name.gsub(/and Guest/, '').strip =~ Regexp.new(Regexp.quote(str.strip), true)
  end

  def empty_rsvp_keys_to_nil
    self.rsvp_key = nil if self.rsvp_key.blank?
  end
end
