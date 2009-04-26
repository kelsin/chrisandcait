require 'csv'

class GuestsController < ApplicationController
  layout "admin"
  before_filter :authenticate
  
  def index
    @categories = Category.find(:all, :order => "categories.name")
    @guests = Guest.find(:all, :order => "guests.name", :conditions => ["category_id is null"])

    respond_to do |format|
      format.html
      format.xml { render :xml => @categories.to_xml }
      format.csv {
        report = StringIO.new
        CSV::Writer.generate(report, ',') do |csv|
          csv << ['Id', 'Category', 'Guest Of', 'Name', 'Address 1', 'Address 2', 'Address 3', 'Address 4', 'Actual Number', 'Estimated Number', 'Sent Thank You']
          @categories.each do |category|
            category.guests.each do |guest|
              address = guest.address.strip.split("\n")
              csv << [guest.id,
                      guest.category.name,
                      if guest.bride then "Bride" else "Groom" end,
                      guest.name,
                      address[0],
                      address[1],
                      address[2],
                      address[3],
                      guest.number_actual_display,
                      guest.number_estimate_display,
                      if guest.sent_thank_you then "Yes" else "No" end]
            end
          end
        end
        report.rewind
        send_data(report.read, :type => 'text/csv', :filename => 'Guests.csv')
      }
    end
  end

  def show
    @guest = Guest.find(params[:id])
  end

  def edit
    @form = Guest.find(params[:id])
  end

  def new
    @form = Guest.new
  end

  def create
    @guest = Guest.new(params[:guest])
    @guest.save
    
    redirect_to :action => :show, :id => @guest.id
  end
  
  def update
    @guest = Guest.update(params[:id], params[:guest])
    
    redirect_to :action => :show, :id => @guest.id
  end
  
  def destroy
    Guest.destroy(params[:id])
    
    redirect_to :action => :index
  end
end
