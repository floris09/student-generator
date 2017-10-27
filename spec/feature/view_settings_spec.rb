require 'rails_helper'

feature 'Admin Settings', js: true do
  let!(:admin) { create :user, admin: true }

    scenario 'admin can see admin settings' do

      visit new_user_session_path

      fill_in "user_email", :with => admin.email
      fill_in "user_password", :with => "123456"
      click_button "Log In"

      visit root_path

      expect(page).to have_link("Admin Settings")
    end
end

feature 'Student Match Link', js: true do
  let!(:student) { create :user, admin: false }

    scenario 'student can see link to their match' do

      visit new_user_session_path

      fill_in "user_email", :with => student.email
      fill_in "user_password", :with => "123456"
      click_button "Log In"

      visit root_path

      expect(page).to have_link("See Your Pairs")
    end
end
