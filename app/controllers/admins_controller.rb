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
    student_emails
    @all_combinations = @student_emails.combination(2).to_a


<<<<<<< HEAD

=======
    # make_arrays
    # @arr1
    # @arr2
    # make_pairs(2)
    # @pairs
>>>>>>> 5e13e7fac624a3f7e33b160212e6777338d6d3c3
  end

  def show
  end

  private

<<<<<<< HEAD
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

  def make_pairs
    @pair = []

    @pair << @arr1.slice!(rand(@arr1.count))
    @pair << @arr2.slice!(rand(@arr1.count))
    @pairs << @pair
    @pair = []

=======
  def student_emails
    @student_emails = []
    @students.each do |student|
      @student_emails << student.email
    end
>>>>>>> 5e13e7fac624a3f7e33b160212e6777338d6d3c3
  end


  # def make_arrays
  #   @arr1 = []
  #   @arr2 = []
  #   students = @students
  #   (@count/2).times{
  #     randomstudent = students.slice!(rand(students.count))
  #     @arr1 << randomstudent.email}
  #   (@count/2).times{
  #     randomstudent = students.slice!(rand(students.count))
  #     @arr2 << randomstudent.email}
  # end
  #
  # def make_pairs(day)
  #   for i in 0...(@arr1.count)
  #     pair = []
  #     pair << @arr1[i]
  #     pair << @arr2[i+day-1]
  #     @pairs << pair
  #   end
  # end
end
