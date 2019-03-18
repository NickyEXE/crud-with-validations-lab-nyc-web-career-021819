class SongsController < ApplicationController

  def index
    @songs = Song.all
    render :index
  end

  def show
    set_song!
    render :show
  end

  def new
    @song = Song.new
    render :new
  end

  def create
    @song = Song.new(song_params)
    if @song.valid?
      @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def edit
    set_song!
    render :edit
  end

  def update
    @song = Song.new(song_params)
    if @song.valid?
      set_song!
      @song.update(song_params)
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def destroy
    set_song!
    @song.destroy
    redirect_to songs_path
  end

  private

  def song_params
    params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
  end

  def set_song!
    @song = Song.find(params[:id])
  end

end
