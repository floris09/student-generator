class AdminsController < ApplicationController
  before_action :authenticate_user!
  before_action do
    redirect_to new_user_session_path unless current_user && current_user.admin?
  end

  def index
    @users = User.all
  end

  def showpair
    if current_user.pair_id == nil
      @pair = Pair.create
      @pair.make_pairs
      current_user.pair_id = @pair.id
      current_user.save
    else
      @pair = Pair.find(current_user.pair_id)
    end

  end


  def update
    user = User.find(params[:id])

    if user.update_attributes(user_params)
      render status: 200, json: user
    else
      render status: 500, json: {
        message: "The room could not be updated",
        errors: room.errors
      }.to_json
    end
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
