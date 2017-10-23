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
    @students = users.select {|a| a.not_admin?}
    @student1 = @students.sample
    @student2 = @students.sample

  end

  def show

  end

  private

  def get_student
    @student1 = @students.sample
    @student2 = @students.sample 

    if @student1 == @student2
      @student1 = @students.sample
    end
  end

end
