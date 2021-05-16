class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: :show

  def show
    find_user
  end

  private

  def find_user
    @user = User.find_by(name: params[:id]) ||
            User.find(params[:id])
  end
end
