class ArtistsController < ApplicationController

  def index
    @artists = Artist.all
  end

  def show
    @artist = Artist.find(params[:id])
    @songs = @artist.songs.all

  end

  def update; end

  def destroy
    @artist = Artist.find(params[:id])
    @artist.destroy
    redirect_to artists_path notice: "Artist deleted"
  end

private

  def artist_params
    params.require(:artist).permit(:name, songs_attributes: [:id, :title])
  end

  def add_song
  @artist = Artist.find(params[:artist_id])
  @artist.update(artist_params)
  end


end
