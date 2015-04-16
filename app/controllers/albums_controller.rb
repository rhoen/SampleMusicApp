class AlbumsController < ApplicationController
  def new
    @band = Band.find(params[:band_id])
    @bands = Band.all
    @album = Album.new
    render :new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to album_url(@album)
    else
      fail
      flash.now[:errors] = @album.errors.full_messages
      render :new
    end
  end

  def show
    @album = Album.find(params[:id])
    render :show
  end

  private
  def album_params
    params.require(:album).permit(:name, :band_id)
  end
end
