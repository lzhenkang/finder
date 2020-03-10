class RequestsController < ApplicationController
before_action :authenticate_user!, :except => [ :show, :index ]
    def all
      @requests = Request.where.not(user: current_user)
    end

    def index
    end

    def new
      @user_id = current_user.id
    end

    def create
      @requests = Request.new(request_params)
      @requests.user = current_user
      @requests.accepted = false
      @requests.save
      # render plain: @request.errors.full_messages
      redirect_to "/requests/all"
    end

    def show
      @requests = Request.find_by(id: params[:id])
      @user_id = current_user.id
      @accepted_request = AcceptedRequest.find_by(request_id: params[:id])
    end

    def edit
    end

    def update
      @request = Request.find(params[:id])

      @request.update(request_params)
      redirect_to @request
    end

    def destroy
      @requests = Request.find(params[:id])
      @requests.destroy

      redirect_to root_path
    end

    def join
      @request = AcceptedRequest.new(join_params)
      @request.request_id = params[:id]
      @request.save
      @accept = Request.find_by(id: params[:id])
      @accept.accepted = true
      @accept.save
      redirect_back(fallback_location: root_path)
    end

    def unjoin
      @request = AcceptedRequest.find_by(request_id: params[:id])
      @request.destroy
      @accept = Request.find_by(id: params[:id])
      @accept.accepted = false
      @accept.save
      redirect_to root_path
    end

    def accepted
      @accepted_request = AcceptedRequest.where(user_id: current_user)
      @accepted_appointment = AcceptedAppointment.where(user_id: current_user)
    end

    def created
      @request = Request.where(user: current_user)
      @appointment = Appointment.where(user: current_user)
    end

end

private
  def request_params
    params.require(:request).permit(:user_id, :description, :location, :accepted)
  end

  def join_params
    params.require(:join).permit(:user_id, :request_id)
  end