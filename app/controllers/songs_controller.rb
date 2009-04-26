class SongsController < ApplicationController
  layout "admin"
  before_filter :authenticate
  
  def index
    @songs = Song.all
    @new_song = Song.new
  end

  def create
    @song = Song.new(params[:song])
    @song.save

    respond_to do |format|
      format.html { redirect_to :action => :index }
    end
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    Song.update(params[:id], params[:song])
    
    respond_to do |format|
      format.html { redirect_to :action => :index }
    end
  end

  def up
    Song.find(params[:id]).move_higher

    redirect_to :action => :index
  end

  def down
    Song.find(params[:id]).move_lower

    redirect_to :action => :index
  end
end
