require 'faker'
require 'database_cleaner'

task generate_clean_random_sample_data: :environment do
  Rake::Task['clear_db'].execute
  Rake::Task['generate_random_sample_data'].execute
end

task generate_random_sample_data: :environment do
  (1..10).each do
    artist = Artist.create(
      name: Faker::Name.name
    )
    puts "Created artist: #{artist.name}."

    (1..5).each do
      album = Album.create(
        artist: artist,
        name: Faker::Company.catch_phrase,
        release_year: (1950..Date.today.year).to_a.sample
      )
      puts "Created album: \"#{album.name}\" from year #{album.release_year} by #{artist.name}."

      (1..10).each do
        song = Song.create(
          album: album,
          name: Faker::Company.catch_phrase
        )
        puts "Created song: \"#{song.name}\" on album \"#{album.name}\"."
      end
    end
  end
end

task clear_db: :environment do
  puts "Clearing DB..."
  DatabaseCleaner.strategy = :truncation
  DatabaseCleaner.clean
  puts "DB cleared."
end