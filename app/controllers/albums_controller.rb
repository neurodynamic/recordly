class AlbumsController < ApplicationController
  def index
    @albums = Album.all.includes(:artist)
  end
end
