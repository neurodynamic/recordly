class AlbumsController < ApplicationController
  def index
    if params[:query].present?
      @albums = Album.search(params[:query]).includes(:artist)
    end

    @albums ||= Album.all.includes(:artist)
  end

  def show
    @album = Album.find(params[:id])
  end
end
