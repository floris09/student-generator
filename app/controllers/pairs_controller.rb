class PairsController < ApplicationController

  def update
    @pair = Pair.last
    @pair.pair_per_day
    @pair.save

  respond_to do |format|
              format.html { redirect_to show_pair_path}
              format.json { render json: @pair }

        end
  end


private

def pair_per_day
  if self.combinations.count > 0
    day = self.combinations.slice!(0)
    self.save
    @daypair = Daypair.create(date: Date.today, pairs: day )
    @daypair.save
  end
end
end
