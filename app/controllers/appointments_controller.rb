class AppointmentsController < ApplicationController
before_action :authenticate_user!, :except => [ :show, :index ]
    def all
      @appointments = Appointment.all
    end

    def new
      @user_id = current_user.id
      puts current_user.id
    end

    def create
      @appointment = Appointment.new(appointment_params)
      @appointment.accepted = false
      @appointment.user = current_user
      @appointment.save
      # render plain: @request.errors.full_messages
      redirect_to root_path
    end

    def show
    end

    def edit
    end

    def update
    end

    def destroy
    end
end

private
  def appointment_params
    params.require(:appointment).permit(:user_id, :time_slot, :accepted, :date)
  end