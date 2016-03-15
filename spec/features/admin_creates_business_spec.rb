require "rails_helper"

feature "Admin creates a business" do
  scenario "is redirected away if not an admin" do
    user = create(:user)

    visit rails_admin_path(as: user)

    expect(current_path).to eq(root_path)
  end
end
