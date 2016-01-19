class AlbumsController < ApplicationController
  def index
    if params[:search].present?
      @albums = Album.where(name: params[:search]).includes(:artist)
    end

    @albums ||= Album.all.includes(:artist)
  end

  def show
    @album = Album.find(params[:id])
  end
end
