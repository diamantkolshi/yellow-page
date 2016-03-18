  require "rails_helper"

feature "Admin dashboard" do
  scenario "visitor is admin" do
    visit rails_admin_path(as: create(:admin))

    expect(page).to have_content("Sign in")
  end

  scenario "visitor is not an admin user" do
    visit rails_admin_path(as: create(:user))

    expect(page).to have_content(
      "You need to sign in or sign up before continuing."
    )
  end
end
