class ExportAppointment
  def export_appointments_day(date, professional)
    date = Date.strptime(date, '%Y-%m-%d')
    title = "Turnos_del_dia_#{date}"
    if not professional.nil?
      title = "Turnos_del_#{date}_para_#{professional.name}"
    end
    template = ERB.new(File.read(Rails.root.join("templates/export_day.html.erb")))
    save_template(template, date, title, appointments_day(date, professional), self.horas())
  end

  def export_appointments_week(professional, date)
    date = first_day(date)
    title = "Turnos_de_la_semana#{date}"
    template = ERB.new(File.read(Rails.root.join("templates/export_week.html.erb")))
    save_template(template, date, title, appointments_week(date, professional), self.horas(), self.dates(date))
  end


  def appointments_day(date, professional)
    appointments = template(professional)
    appointments = appointments.select { |appointment| appointment.date.to_date == date }
    apposTemplate = {}
    apposTemplate[date] = {}
    self.horas.each do |hour|
      apposTemplate[date][hour] = []
      appointments.each do |appointment|
        if date == appointment.date.to_date && hour == appointment.get_only_hour
          apposTemplate[date][hour] << appointment
        end
      end
    end
    apposTemplate
  end

  def template(professional)
    appointments = []
    if professional.nil?
      Professional.all.map do |prof|
        appointments += prof.appointments
      end
    else
      appointments = professional.appointments
    end
    appointments
  end

  def horas
    horas = []
    (10..20).each do |i|
      horas << "#{i}:00"
      horas << "#{i}:30"
    end
    horas
  end

  def dates(date)
    dates = []
    (1...7).each do
      dates << date
      date = date.next_day
    end
    dates
  end

  def first_day(date)
    #Domingo es 0
    if date.wday > 1
      date = date - (date.wday-1)
    else
      if date.wday == 0
        date = date + 1
      end
    end
    date
  end

  def appointments_week(date, professional)
    appointments = template(professional)
    appointments.select { |appoinment| (date..date+6).cover? appoinment.get_date }
  end

  def save_template(template, date, title, appointments, horas, dates=nil)
    File.open(Rails.root.join("tmp/appointments_of_#{date}.html"), "w+") {|file| file.write("#{template.result binding}")}
  end
end