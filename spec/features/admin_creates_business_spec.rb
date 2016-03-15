require "rails_helper"

feature "Admin creates a business" do
  scenario "is redirected away if not an admin" do
    visit rails_admin_path(as: create(:user))

    expect(current_path).to eq(new_user_session_path)
  end
end
