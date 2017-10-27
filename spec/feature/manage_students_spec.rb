require 'rails_helper'

feature 'Manage students' do
  let!(:user) { create :user, admin: false, id: '1000' }

  scenario 'can see match for the day and previous matches' do
    visit new_user_session_path

    fill_in "user_email", :with => user.email
    fill_in "user_password", :with => "123456"
    click_button "Log In"

    visit user_path(user)

    expect(page).to have_content("My match today")
    expect(page).to have_content("History")

  end
  end
