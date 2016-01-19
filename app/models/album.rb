class Album < ActiveRecord::Base
  belongs_to :artist
  has_many :songs

  # Case insensitive prefix search
  def self.search(query)
    where('lower(name) LIKE ?', "#{query.downcase}%")
  end

  def artist_name
    artist.name
  end

  def description
    "#{songs.count} songs by #{artist_name}"
  end
end
