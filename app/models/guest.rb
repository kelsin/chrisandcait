class Guest < ActiveRecord::Base
    belongs_to :category

    def number_display
        number || number_estimate
    end
end
