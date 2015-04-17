class TracksController < ApplicationController
  before_action :redirect_unless_logged_in
  def new
    @album = Album.find(params[:album_id])
    @albums = Album.all
    @track = Track.new
    render :new
  end

  def create
    @track = Track.new(track_params)
    if @track.save
      redirect_to track_url @track
    else
      flash.now[:errors] = @track.errors.full_messages
      render :new
    end
  end

  def show
    @track = Track.find(params[:id])
    @album = @track.album
    render :show
  end

  def destroy
    @track = Track.find(params[:id])
    @album = @track.album
    @track.delete
    flash[:success] = ["track deleted"]
    redirect_to album_url @album
  end

  private
  def track_params
    params.require(:track).permit(:name, :album_id, :lyrics)
  end
end
