require 'rails_helper'

feature 'Manage students' do
  before { sign_in user }
  let!(:user) { create :user, admin: false, id: '1000' }

  scenario 'can see match for the day' do

    visit root_path

    expect(page).to have_content("Your Match For Today")

  end
end
