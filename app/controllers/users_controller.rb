class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[show search]

  def show
    find_user
  end

  def search
    find_user
    redirect_to user_path(@user)
  end

  private

  def find_user
    @user = User.find_by(name: params[:id]) ||
            User.find(params[:id])
  end
end
