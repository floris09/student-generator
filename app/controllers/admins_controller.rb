class AdminsController < ApplicationController
  before_action :authenticate_user!
  before_action do
    redirect_to new_user_session_path unless current_user && current_user.admin?
  end

  def index
    @users = User.all
  end

  def showpair
      @pair = Pair.create.make_pairs if Pair.count == 0
      @pair = Pair.last
      @pair.make_pairs if @pair.combinations.count == 0

      @daypair = Daypair.last
      @daypairs = Daypair.history.all.order(date: :desc)
      @dayfuture = Daypair.after_today.all

  end


  def update; end


  def show; end

  private

  def user_params
    params.require(:user).permit(:admin)
  end


  end
