class AppointmentsController < ApplicationController
  load_and_authorize_resource
  before_action :set_professional
  before_action :set_appointment, only: %i[ show edit update destroy ]

  # GET /appointments or /appointments.json
  def index
    @appointments = @professional.appointments.order(:date)
  end

  # GET /appointments/1 or /appointments/1.json
  def show
  end

  # GET /appointments/new
  def new
    @appointment = Appointment.new
  end

  # GET /appointments/1/edit
  def edit
  end

  # POST /appointments or /appointments.json
  def create
    @appointment = @professional.appointments.new(appointment_params)

    respond_to do |format|
      if @appointment.save
        redirect_to [@professional, @appointment], notice: "Appointment was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
    end
  end

  # PATCH/PUT /appointments/1 or /appointments/1.json
  def update
    if @appointment.update(appointment_params)
      redirect_to [@professional, @appointment], notice: "Appointment was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /appointments/1 or /appointments/1.json
  def destroy
    if @appointment.destroy
      message = "Appointment was successfully cancelled."
    else
      message = @appointment.errors.full_messages.to_sentence
    end
    redirect_to professional_appointments_path(@professional), notice: message
  end

  def cancel_all
    @professional.cancel_all
    redirect_to professional_appointments_path(@professional), notice: "Appointments successfully cancelled."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointment
      @appointment = @professional.appointments.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def appointment_params
      params.require(:appointment).permit(:date, :name, :surname, :phone, :notes)
    end

   def set_professional
    @professional = Professional.find(params[:professional_id])
   end
end
