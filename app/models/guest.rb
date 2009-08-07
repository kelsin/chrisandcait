class Guest < ActiveRecord::Base
  belongs_to :category
  default_scope :order => "guests.name"
  named_scope :chris, :conditions => { :bride => false }
  named_scope :cait, :conditions => { :bride => true }

  before_save :empty_rsvp_keys_to_nil

  named_scope :rsvp_yes, { :conditions => 'number > 0' }
  named_scope :rsvp_no, { :conditions => 'number = 0' }
  named_scope :did_not_rsvp, { :conditions => 'number is null' }

  # Class Methods
  def self.number_coming
    self.rsvp_yes.sum(:number)
  end

  def self.number_not_coming
    self.rsvp_no.sum(:number_estimate).to_i + self.rsvp_yes.sum('number_estimate - number').to_i
  end

  def self.number_might_come
    self.did_not_rsvp.sum(:number_estimate)
  end

  def rsvp?
    !number.nil?
  end

  def coming?
    !number.nil? and number > 0
  end

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
    (self.num_carrot + self.num_chocolate + self.num_vanilla + self.num_cheese) <= self.number
  end

  def num_carrot
    read_attribute(:num_carrot).to_i || 0
  end

  def num_chocolate
    read_attribute(:num_chocolate).to_i || 0
  end

  def num_vanilla
    read_attribute(:num_vanilla).to_i || 0
  end

  def num_cheese
    read_attribute(:num_cheese).to_i || 0
  end

  def name_check_valid?(str)
    return false if str.blank? || str.length <= 3

    self.name.gsub(/guest/i, '').gsub(/\ and\ /i, ' ').gsub(/\&/i, '').strip =~ Regexp.new(Regexp.quote(str.strip), true)
  end

  def empty_rsvp_keys_to_nil
    self.rsvp_key = nil if self.rsvp_key.blank?
  end
end
