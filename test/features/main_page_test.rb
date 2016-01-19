require 'test_helper'

feature 'MainPage' do
  before do
    DatabaseCleaner.clean
    
    @artist = create :artist
    @album = create :album, artist: @artist

    (1..10).each do
      create :song, album: @album
    end
  end

  scenario 'main page exists' do
    visit root_path
    page.must_have_content 'Albums'
  end

  scenario 'page should show albums' do
    visit root_path
    page.must_have_content @album.name
  end
end
