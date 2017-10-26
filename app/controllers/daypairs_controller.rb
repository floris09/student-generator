class DaypairsController < ApplicationController

  def update
    @pair = Pair.create.make_pairs if Pair.count == 0
    @pair = Pair.last
    @pair.make_pairs if @pair.combinations.count == 0
    @day = @pair.combinations.slice!(0)
    @pair.save
    @daypair = Daypair.create(daypair_params.merge(pairs: @day))

    respond_to do |format|
      format.html { redirect_to show_pair_path}
      format.json { render json: @daypair }
    end
  end

  private

  def daypair_params
    params.require(:daypair).permit(:date)
  end
end
