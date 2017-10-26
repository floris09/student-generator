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

end
