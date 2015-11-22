require "rails_helper"

feature "Can access the App" do
  scenario "accesses the home page" do
    visit root_path
    expect(page).to have_content("This is homepage!")
  end
end
