class AdminsController < ApplicationController
  before_action :authenticate_user!
  before_action do
    redirect_to new_user_session_path unless current_user && current_user.admin?
  end

  def index
    @users = User.all
  end

  def showpair
    if Pair.count == 0
      @pair = Pair.create
      @pair.make_pairs
    else
      @pair = Pair.last
    end


    @pair.pair_per_day
    @daypair = Daypair.last
    @daypairs = Daypair.all
  end


  def update
  end


    def show
    end


  private

  def student_emails
    @student_emails = []
    @students.each do |student|
      @student_emails << student.email
    end
  end



  def user_params
    params.require(:user).permit(:admin)
  end

  end
