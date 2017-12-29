require 'rails_helper'

RSpec.describe Artist, type: :model do
  describe "association with song" do
    let(:artist) { create :artist }
    let!(:song) { create :song, artist: artist }

    it "has many songs" do
      song1 = artist.songs.new(title: "Feeling good")
      song2 = artist.songs.new(title: "Feel it still")

      expect(artist.songs).to include(songs1)
      expect(artist.songs).to include(songs2)
    end

    it "deletes associated songs" do
      expect { artist.destroy }.to change(Song, :count).by(-1)
    end
  end

  describe "validations" do
    it "is invalid without a name" do
      artist = Artist.new(name: "")
      artist.valid?
      expect(artist.errors).to have_key(:name)
    end
  end
end
