  class AdminsController < ApplicationController
      before_action :authenticate_user!
      before_action do
        redirect_to new_user_session_path unless current_user && current_user.admin?
      end

    def index
      @users = User.all
    end

    def showpair
      @users = User.all
      @students = @users.select {|a| a.not_admin?}
      round_robin
      @pairs
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


    def round_robin
      student_emails
        @pairs = (1...@student_emails.size).map do |r|
        s = @student_emails.dup
        (0...(@student_emails.size/2)).map do |_|
        [s.shift,s.delete_at(-(r % s.size + (r >= s.size * 2 ? 1 : 0)))]
       end
       end
     end


  def user_params
    params.require(:user).permit(:admin)
  end

  end
