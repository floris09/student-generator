class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user, only: [:edit, :update]
  before_action :user_params, only: [:update]

    def index; end

    def show; end

    def edit;end

    def update
    if @user.update_attributes(user_params)
      redirect_to admins_path
    else
      render 'edit'
    end
  end

    private

    def find_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:admin)
    end

end
