class AppointmentsController < ApplicationController
before_action :authenticate_user!, :except => [ :show, :index ]
    def all
      @appointments = Appointment.where.not(user: current_user)
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
      redirect_to root_path
    end

    def show
      @appointments = Appointment.find_by(id: params[:id])
      @user_id = current_user.id
    end

    def edit
    end

    def update
    end

    def destroy
    end

    def join
      @appointments = AcceptedAppointment.new(join_params)
      @appointments.appointment_id = params[:id]
      @appointments.save
      @accept = Appointment.find_by(id: params[:id])
      @accept.accepted = true
      @accept.save
      redirect_back(fallback_location: root_path)
    end

    def unjoin
      @appointments = AcceptedAppointment.find_by(appointment_id: params[:id])
      @appointments.destroy
      @accept = Appointment.find_by(id: params[:id])
      @accept.accepted = false
      @accept.save
      redirect_back(fallback_location: root_path)
    end
end

private
  def appointment_params
    params.require(:appointment).permit(:user_id, :time_slot, :accepted, :date)
  end

    def join_params
    params.require(:join).permit(:user_id, :request_id)
  end