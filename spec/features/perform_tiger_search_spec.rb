require "rails_helper"

describe 'as a user' do
  it 'can search for tigers' do
    # As a user
    # When I visit "/"
    visit root_path

    # And I enter "tiger" in the search box
    fill_in "q", with: "tiger"

    # and I click "Search"
    click_on "Search"
# binding.pry
    # Then my path should be /search with "q=tiger" in the parameters
    expect(current_path).to eq('/search')
    expect(current_url).to include("q=tiger")

    # And I should see "5 Results"
    expect(page).to have_content("5 Results")
    expect(page).to have_css(".id", count: 5)

    # And I should see an id, a url, and the gif.
    within(first(".id")) do
      expect(page).to have_css(".id")
      expect(page).to have_css(".url")
      expect(page).to have_css(".gif")
    end
  end
end
