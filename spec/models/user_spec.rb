require 'rails_helper'

RSpec.describe User, type: :model do

  describe "#admin?" do
  let(:user) {create :user, admin: true}

   it "returns true if user is admin" do
     expect(user.admin?).to eq(true)
   end
 end

 describe "#not_admin?" do
 let(:user) {create :user}

  it "returns true if user is admin" do
    expect(user.admin?).to eq(false)
  end
end




end
