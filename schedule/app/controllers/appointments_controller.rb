class AppointmentsController < ApplicationController
  before_action :set_schedule
  before_action :set_schedule_appointment, only: [:show, :destroy]

  # GET /schedules/:schedule_id/appointments
  def index
    json_response(@schedule.appointments)
  end

  # GET /schedules/:schedule_id/appointments/:id
  def show
    json_response(@appointment)
  end

  # POST /schedules/:schedule_id/appointments
  def create
    @schedule.appointments.create!(appointment_params)
    json_response(@schedule, :created)
  end

  # DELETE /schedules/:schedule_id/appointments/:id
  def destroy
    @appointment.destroy
    head :no_content
  end

  private

  def appointment_params
    params.permit(:start_time, :end_time, :description, :schedule)
  end

  def set_schedule
    @schedule = Schedule.find(params[:schedule_id])
  end

  def set_schedule_appointment
    @appointment = @schedule.appointments.find_by!(id: params[:id]) if @schedule
  end
end
