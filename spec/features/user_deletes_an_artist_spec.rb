require 'rails_helper'

RSpec.feature "User deletes an artist" do
  scenario "they click delete on individual artist page" do
    artist1 = Artist.create(name: "Bob Marley", image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")
    artist2 = Artist.create(name: "Ween", image_path: "https://upload.wikimedia.org/wikipedia/commons/2/28/Ween.jpg")
    artist3 = Artist.create(name: "Charles Manson", image_path: "http://www.nndb.com/people/449/000022383/manson1-gloom.jpg")

    visit artist_path(artist3)

    click_link("Delete")

    expect(page).to_not have_content("Charles Manson")
  end
end
