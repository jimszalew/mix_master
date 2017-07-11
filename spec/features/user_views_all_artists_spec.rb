require 'rails_helper'

RSpec.feature "User views all artists" do
  scenario "they see each artist's name" do
    artist1 = Artist.create(name: "Bob Marley", image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")
    artist2 = Artist.create(name: "Ween", image_path: "https://upload.wikimedia.org/wikipedia/commons/2/28/Ween.jpg")
    artist3 = Artist.create(name: "Charles Manson", image_path: "http://www.nndb.com/people/449/000022383/manson1-gloom.jpg")

    visit '/artists'

    expect(page).to have_content(artist1.name)
    expect(page).to have_content(artist2.name)
    expect(page).to have_content(artist3.name)

    expect(page).to have_link("Bob Marley")
    expect(page).to have_link("Ween")
    expect(page).to have_link("Charles Manson")
  end

  scenario "they click the artist's name" do
    artist1 = Artist.create(name: "Bob Marley", image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")

    visit '/artists'

    click_link("Bob Marley")

    expect(page).to have_content("Bob Marley")
  end
end
