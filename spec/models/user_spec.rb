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

describe ".order_by_admin" do
   subject { User.order_by_admin }

     let(:user1) { create :user, admin: true }
     let(:user2) { create :user, admin: false }

    it "is sorted on admin in descending order" do
       expect(subject).to eq([user1, user2])
     end
   end

describe "validations" do
  it "is invalid without a first name" do
    user = User.new(first_name: "")
    user.valid?
    expect(user.errors).to have_key(:first_name)
  end

  it "is invalid without last name" do
    user = User.new(first_name: "")
    user.valid?
    expect(user.errors).to have_key(:last_name)
  end
end





end
