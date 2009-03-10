class GuestsController < ApplicationController
    before_filter :authenticate
    
    def index
        @guests = Guest.find(:all)
    end
end
