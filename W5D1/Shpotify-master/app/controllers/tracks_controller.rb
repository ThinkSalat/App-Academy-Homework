class TracksController < ApplicationController
  def index
    @tracks = Track.all
    render :index
  end

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
      flash[:error] = @track.errors.full_messages
      redirect_to new_track_url
    end
  end

  def edit
    @track = Track.find(params[:id])
    render :edit
  end

  def update
    @track = Track.find(params[:id])
    if @track.update_attributes(track_params)
      redirect_to track_url(@track)
    else
      flash[:error] = @track.errors.full_messages
      redirect_to edit_track_url
    end
  end

  private
  def track_params
    params.require(:track).permit(:title, :ord, :album_id, :lyrics, :bonus)
  end
end
