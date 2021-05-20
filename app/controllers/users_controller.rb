class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[show search]
  before_action :find_user, only: %i[search show]

  def show
    if params[:id].to_i == @user.id
      redirect_to user_path(@user.name)
    end
  end

  def search
    redirect_to user_path(@user.name)
  end

  private

  def find_user
    begin
      @user = User.find_by(name: params[:id]) ||
              User.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to root_path, alert: "User \"#{params[:id]}\" not found."
    end
  end
end
