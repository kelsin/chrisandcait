class RsvpController < ApplicationController
  def index
  end

  def create
    @guest = Guest.find_by_rsvp_key(params[:key])
    
    if @guest
      redirect_to rsvp_url(@guest)
    else
      flash[:error] = 'Sorry, that rsvp key was not found'
      render :action => 'index'
    end
  end

  def show
    @guest = Guest.find(params[:id])
    @name_check = ''
    
    respond_to do |format|
      format.html
    end
  end

  def update
    @guest = Guest.find(params[:id])
    @name_check = params[:name_check]

    @guest.update_attributes(params[:guest])

    @guest.errors.add_to_base 'Please select one cake serving for each guest attending' unless @guest.cake_numbers_valid?

    @guest.errors.add_to_base 'Name provided did not match invitation' unless @guest.name_check_valid?(@name_check)

    @guest.rsvp_on = Time.now

    if verify_recaptcha(:model => @guest) && @guest.errors.empty? && @guest.save
      Rsvp.deliver_notify(@guest)
      respond_to do |format|
        format.html
      end
    else
      render :action => 'show'
    end
  end
end
