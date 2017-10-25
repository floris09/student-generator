require 'rails_helper'

feature 'Manage admins', js: true do
  let!(:admin) { create :user, admin: true }
  let!(:student) { create :user, admin:false, id: '1000' }

  scenario 'make a new admin' do

    visit new_user_session_path

    fill_in "user_email", :with => admin.email
    fill_in "user_password", :with => "123456"
    click_button "Log in"

    visit admins_path

    page.find("#toggle-admin-1000").click
    # page.execute_script("promoteAdmin(1000)")

    sleep(1)

    expect(page.find("#toggle-admin-1000")).to have_content("Make Student")

  end
end
