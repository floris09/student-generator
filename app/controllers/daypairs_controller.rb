class DaypairsController < ApplicationController

  def update
    @pair = Pair.create.make_pairs if Pair.count == 0
    @pair = Pair.last
    @pair.make_pairs if @pair.combinations.count == 0
    @day = @pair.combinations.slice!(0)
    @pair.save
    @daypair = Daypair.create(daypair_params.merge(pairs: @day))
    redirect_to show_pair_path

  end

  private

  def daypair_params
    params.require(:daypair).permit(:date)
  end
end
