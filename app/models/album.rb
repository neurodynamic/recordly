class Album < ActiveRecord::Base
  belongs_to :artist
  has_many :songs

  def artist_name
    artist.name
  end

  def description
    "#{songs.count} songs by #{artist_name}"
  end
end
