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
    @pairs = []
    i = @students.count
    while i > 0 do
      get_student
      i -= 1
    end
    @pairs
end


  def show

  end

  private

  def get_student
    @student1 = @students.sample
    @student2 = @students.sample
    while @student1 == @student2
      @student1 = @students.sample
    end
    @pair = [@student1.email, @student2.email]
    add_pair_to_array
  end

  def add_pair_to_array

    unless @pairs.include?([@student1.email,@student2.email]) || @pairs.include?([@student2.email,@student1.email]) do

    @pairs << @pair

    end
  end
end
end
