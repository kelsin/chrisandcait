class Guest < ActiveRecord::Base
    belongs_to :category
    named_scope :chris, :conditions => { :bride => false }
    named_scope :cait, :conditions => { :bride => true }
    
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
end
