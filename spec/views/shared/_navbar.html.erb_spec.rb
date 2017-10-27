require 'rails_helper'

describe "shared/_navbar.html.erb" do

  context "when user not signed in" do
    let(:user) { create :user }

    it "renders Log In" do
      render
      expect(rendered).to have_content("Log In")
    end
  end

  context "when user signed in" do
    before { sign_in user }
    let(:user) { create :user }

    it "renders full name" do
      render
      expect(rendered).to have_content user.full_name
    end
  end
end
