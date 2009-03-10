class GuestsController < ApplicationController
    before_filter :authenticate
    
    def index
        @guests = Guest.find(:all, :order => "name")
    end

    def new
        @guest = Guest.new
    end

    def create
        @guest = Guest.new(params[:guest])
        @guest.save
        
        redirect_to :action => :index
    end
end
