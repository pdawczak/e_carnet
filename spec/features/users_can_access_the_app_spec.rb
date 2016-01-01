require "rails_helper"

feature "Users can access the App" do
  scenario "new client can register" do
    visit root_path

    expect(page).to have_content("Register as Client")
    click_link "Register as Client"

    within("#new-client") do
      fill_in "Email", with: "test@user.com"
      fill_in "Password", with: "QweRty123"
      fill_in "Password confirmation", with: "QweRty123"
      click_button "Register"
    end

    expect(page).to have_content(
      "Welcome test@user.com. You've been registered correctly!"
    )
  end

  scenario "new professional can register" do
    visit root_path

    expect(page).to have_content("Register as Professional")
    click_link "Register as Professional"

    within("#new-professional") do
      fill_in "Email", with: "test@user.com"
      fill_in "Password", with: "QweRty123"
      fill_in "Password confirmation", with: "QweRty123"
      click_button "Register"
    end

    expect(page).to have_content(
      "Welcome test@user.com. Your professional account has been created!"
    )
  end
end
