class SongsController < ApplicationController
    before_action :load_artist
    
    def index
        @songs = artist.songs
    end

    def show; end

    def new
    @song = Song.new
    end

  def create
    @song = Song.new(song_params)

    if @song.save
        redirect_to artist_path(:id), notice: "Song created"
      else
        render :new
      end
  end

  def edit; end
  def update; end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    redirect_to artist_path(:id), notice: "Song deleted"
  end


  private

  def song_params
    params.require(:song).permit(:title, :artist_id)
  end

  def add_song
  @artist = Artist.find(params[:artist_id])
  @artist.update(artist_params)
end



  def load_artist
    @artists = Artist.all
  end


end
