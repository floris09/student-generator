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

  private

  def student_emails
    @student_emails = []
    @students.each do |student|
      @student_emails << student.email
    end
  end

  def all_pairs
    @arr1 = []
    randompair = @all_combinations.slice!(0)
    @arr1 << randompair



    while @arr1.count < (@count/2) do
        @i = @all_combinations.count
        @randompair = @all_combinations.slice!(rand(@i-1))
        @arr1.each do |pair|
           @arr1 << @randompair unless pair.include?(@randompair[0]) || pair.include?(@randompair[1])
    end
end

end

def user_params
  params.require(:user).permit(:admin)
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
  # end
end
