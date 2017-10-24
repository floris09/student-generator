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
    all_pairs
    @arr1


    # make_arrays
    # @arr1
    # @arr2
    # make_pairs(2)
    # @pairs
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

  def all_pairs
    @arr1 = []
    @i = @all_combinations.count
    randompair = @all_combinations.slice!(rand(@i))
    @arr1 << randompair

    while @arr1.count <= (@count/2) do
        randompair = @all_combinations.slice!(rand(@i))
        student1 = randompair[0]
        student2 = randompair[1]
        @arr1.each do |pair|
        pair.each do |student|
        if student != student1 && student != student2
       @arr1 << randompair
      end
    end
end
  end
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
