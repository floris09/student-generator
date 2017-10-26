class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user, only: [:edit, :update]
  before_action :user_params, only: [:update]

  def index; end

  def show
    my_match
    @daypairs = Daypair.before_today.all.order(date: :desc)
  end

  def edit;end

  def update
    user = User.find(params[:id])

    if user.update_attributes(user_params)
      render status: 200, json: user
    else
      render status: 500, json: {
        message: "The user could not be updated",
        errors: user.errors
      }.to_json
    end
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:admin, :first_name, :last_name)
  end

  def my_match
    @count = Daypair.all.today.count
    @daypair = Daypair.all.today.last
    if @count > 0
      @daypair.pairs.each { |pair|
        pair.each do |student|
          @pair = nil
          @pair = pair if student.include?(current_user.full_name)
        end
      }
    end
  end

end
