class BandsController < ApplicationController
  before_action :require_login
  def new
    @band = Band.new
    render :new
  end

  def create
    @band = Band.new(band_param)
    if @band.save
      redirect_to band_url(@band)
    else
      render :new
    end


  end

  def index
    @bands = Band.all
    render :index

  end

  def show
    @band = Band.find(params[:id])
    @albums = @band.albums
    render :show

  end

  def destroy
    band = Band.find(params[:id])
    band.destroy!
    redirect_to bands_url
  end


  private
  def band_param
    params.require(:band).permit(:name)
  end


end
