class TracksController < ApplicationController
  before_action :require_login
  def show
    @track = Track.find(params[:id])

    render :show
  end

  def new
    @track = Track.new
    render :new
  end

  def create
    @track = Track.new(track_params)
    if @track.save
      redirect_to track_url(@track)
    else
      render :new
    end

  end

  private
  def track_params
    params.require(:track).permit(:album_id, :title, :lyrics, :track_type)
  end

end
