class AlbumsController < ApplicationController
  before_action :require_login
  def index
    @albums = Album.all
    render :index
  end

  def show
    @album = Album.find(params[:id])
    @tracks = @album.tracks
    render :show
  end

  def new
    @album = Album.new
    @band = Band.find(params[:band_id])
    render :new
  end

  def create
    @band = Band.find(params[:album][:band_id])
    # fail
    @album = Album.new(album_params)
    if @album.save
      redirect_to album_url(@album)
    else
      render :new
    end


  end

  def destroy
    album = Album.find(params[:id])
    unless current_user.is_admin?

      redirect_to new_session_url
    end
    album.destroy!
    redirect_to bands_url
  end

  private

  def album_params
    params.require(:album).permit(:album_name, :recording, :band_id)
  end


end
