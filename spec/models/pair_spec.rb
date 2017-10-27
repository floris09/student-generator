require 'rails_helper'

RSpec.describe Pair, type: :model do

#  works without shuffle
#  describe ".make_pairs" do
#      let!(:pair)  { create :pair}
#      let!(:user1) { create :user }
#      let!(:user2) { create :user }
#      let!(:user3) { create :user }
#      let!(:user4) { create :user }

#      before do
#        pair.make_pairs
#      end

#    it "stores all students combinations inside pair" do
#       expect(pair.combinations).to include([[user1.full_name, user4.full_name], [user2.full_name, user3.full_name]])
#     end
#  end

  describe ".make_pairs" do
      let!(:pair)  { create :pair}
      let!(:user1) { create :user }
      let!(:user2) { create :user }
      let!(:user3) { create :user }
      let!(:user4) { create :user }
      let!(:admin) { create :user, admin: true}

      before do
        pair.make_pairs
      end

    it "does combinations with all students" do
       expect(pair.combinations.map(&:join).to_s).to include(user1.full_name, user2.full_name, user3.full_name, user4.full_name )
     end
    it "doesn't include admins in combinations" do
        expect(pair.combinations.map(&:join).to_s).not_to include(admin.full_name)
    end
  end

end
