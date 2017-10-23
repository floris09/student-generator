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
    @count = @students.count
    make_arrays
    @arr1
    @arr2


  end

  def show

  end

  private

  def make_arrays
    @arr1 = []
    @arr2 = []
    students = @students
    (@count/2).times{
      randomstudent = students.slice!(rand(students.count))
      @arr1 << randomstudent.email}
    (@count/2).times{
      randomstudent = students.slice!(rand(students.count))
      @arr2 << randomstudent.email}

  end

end
