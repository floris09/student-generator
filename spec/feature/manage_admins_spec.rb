require 'rails_helper'

feature 'Manage admins', js: true do
  let!(:admin) { create :user, admin: true }
  let!(:student) { create :user, admin: false, id: '1000' }
  let!(:admin2) { create :user, admin: true, id: '2000' }

  scenario 'make a new admin' do

    visit new_user_session_path

    fill_in "user_email", :with => admin.email
    fill_in "user_password", :with => "123456"
    click_button "Log in"

    visit admins_path

    page.find("#toggle-admin-1000").click

    expect(page.find("#toggle-admin-1000")).to have_content("Make Student")

  end

  scenario 'demote to student' do

    visit new_user_session_path

    fill_in "user_email", :with => admin.email
    fill_in "user_password", :with => "123456"
    click_button "Log in"

    visit admins_path

    page.find("#toggle-admin-2000").click

    expect(page.find("#toggle-admin-2000")).to have_content("Make Admin")

  end

end
