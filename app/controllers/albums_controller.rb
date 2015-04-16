class AlbumsController < ApplicationController
  def new
    @band = Band.find(params[:band_id])
    @bands = Band.all
    @album = Album.new
    render :new
  end

  def create

  end

  def show

  end
end
