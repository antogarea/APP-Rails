class ExportsController < ApplicationController
  load_and_authorize_resource

  def new
    @professionals = Professional.order(:name)
    @export = Export.new
  end

  def export_appointments
    @export = Export.new(exports_params)
    if @export.valid?
      exportAppointment = ExportAppointment.new()
      unless exports_params[:professional].blank?
        @professional = Professional.find(@export.professional)
      end
      if @export.type == "Dia"
        exportAppointment.export_appointments_day(@export.date, @professional)
        date = @export.date
      else
        exportAppointment.export_appointments_week(@export.date, @professional)
        date = @export.date.to_date.at_beginning_of_week
      end
      send_file(Rails.root.join("tmp/appointments_of_#{date}.html"))
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def exports_params
    params.require(:form_data).permit(:professional, :date, :type)
  end
end