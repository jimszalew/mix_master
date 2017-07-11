require 'rails_helper'

RSpec.feature "User edits an artist" do
  scenario "they click Edit from individual artist page" do
    artist = Artist.create(name: "Ween", image_path: "https://upload.wikimedia.org/wikipedia/commons/2/28/Ween.jpg")

    visit artist_path(artist)

    click_link("Edit")

    new_name = "Dean and Gene Ween"
    fill_in "artist_name", with: new_name

    click_button("Update Artist")

    expect(page).to have_content(new_name)
    expect(page).to have_css("img[src=\"#{artist.image_path}\"]")
  end
end
