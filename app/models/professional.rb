class Professional < ApplicationRecord
  validates :name, presence: true, length: { maximum: 20}

  def to_s
    name
  end

  def find_appointment(appointment)
    if self.appointments.where("date = ? AND id != ?", appointment.date, appointment.id).exists?
      true
    else
      false
    end
  end

end
