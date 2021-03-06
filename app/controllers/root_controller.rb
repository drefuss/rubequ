class RootController < ApplicationController
  def index
  end

  def connected
    mpd = RubequMpd::Mpd.new
    connected = mpd.connected?
    mpd.disconnect
    respond_to do |format|
      format.json { render :json => connected } 
    end
  end

  def volume
    mpd = RubequMpd::Mpd.new
    volume = mpd.volume
    mpd.disconnect
    respond_to do |format|
      format.json { render :json => volume } 
    end
  end

  def update_volume
    mpd = RubequMpd::Mpd.new
    volume = mpd.volume(params[:volume])
    mpd.disconnect
    respond_to do |format|
      format.json { render :json => volume }
    end
  end
end
