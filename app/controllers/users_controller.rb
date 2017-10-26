class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user, only: [:edit, :update]
  before_action :user_params, only: [:update]

    def index; end

    def show
      my_match
      @daypairs = Daypair.limit(10).order(created_at: :desc).all
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
      @daypair = Daypair.last
      @daypair.pairs.each do |pair|
      pair.each do |student|
        if student.include?(current_user.full_name)
          @pair = pair
        end
      end
    end
    end

end
