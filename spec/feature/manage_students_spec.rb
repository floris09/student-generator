require 'rails_helper'

feature 'Manage Students', js: true do
  let!(:admin) { create :user, admin: true }
  let!(:student) { create :user, admin:true, id: '500' }

  scenario 'make a new student' do

    visit new_user_session_path

    fill_in "user_email", :with => admin.email
    fill_in "user_password", :with => "123456"
    click_button "Log in"

    visit admins_path

    page.find("#toggle-admin-500").click

    sleep(1)

    expect(page.find("#toggle-admin-500")).to have_content("Make Admin")

  end
end
