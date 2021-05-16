class CheckinsController < ApplicationController
  def new
    @checkin = Checkin.new
  end

  def create
    @checkin = Checkin.new(checkin_params)
    @checkin.user = current_user

    pulse_status = PulseStatus.find(params[:checkin][:pulse_status_id])
    @checkin.pulse_status = pulse_status

    if @checkin.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def show
  end

  private

  def checkin_params
    params.require(:checkin)
          .permit(:location, :message, :pulse_status_id)
  end
end
