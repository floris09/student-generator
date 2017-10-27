require 'rails_helper'

RSpec.describe Daypair, type: :model do
  let!(:date_history) { create :daypair, date: "2017-10-25" }
  let!(:date_today) { create :daypair, date: "2017-10-27" }
  let!(:date_future) { create :daypair, date: "2017-10-29" }

  it "#before_today scope shows history pairs" do
    expect(Daypair.before_today).to eq([date_history])
  end

  it "#today scope shows pairs for current date" do
    expect(Daypair.today).to eq([date_today])
  end

  it "#after_today scope shows pairs for future" do
    expect(Daypair.after_today).to eq([date_future])
  end


end
