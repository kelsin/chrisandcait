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

  def empty_rsvp_keys_to_nil
    self.rsvp_key = nil if self.rsvp_key.empty?
  end
end
