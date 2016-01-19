require 'test_helper'

feature 'AlbumSearch' do
  before do
    DatabaseCleaner.clean

    @artist = create :artist

    @album = create :album, artist: @artist
    (1..10).each { create :song, album: @album }

    @nonmatching_album = create :album, artist: @artist
    (1..10).each { create :song, album: @nonmatching_album }
  end

  scenario 'search shows only matching albums' do
    visit root_path
    fill_in 'query', with: @album.name
    click_button 'Search'

    page.must_have_content @album.name
    page.wont_have_content @nonmatching_album.name
  end

  scenario 'search matches case insensitively' do
    visit root_path
    fill_in 'query', with: @album.name.upcase
    click_button 'Search'

    page.must_have_content @album.name
  end

  scenario 'search matches prefixes' do
    visit root_path
    fill_in 'query', with: @album.name[0..2]
    click_button 'Search'

    page.must_have_content @album.name
  end
end
