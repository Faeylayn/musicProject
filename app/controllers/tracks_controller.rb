class TracksController < ApplicationController
  before_action :require_login
  def show
    @track = Track.find(params[:id])
    @notes = @track.notes

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

  def destroy
    track = Track.find(params[:id])
    unless current_user.is_admin?

      redirect_to track_url(params[:track_id])
    end
    track.destroy!
    redirect_to bands_url
  end



  private
  def track_params
    params.require(:track).permit(:album_id, :title, :lyrics, :track_type)
  end

end
