class Appointment < ApplicationRecord
  belongs_to :professional
  validates :name, :surname, :phone, :date, presence: true
  validates :notes, length: { maximum: 50}
  validates :phone, numericality: { only_integer: true }
  validates :date, uniqueness: {scope: :professional_id}

  validate :valid_date, :after_today?

  def valid_date
    if !(self.date.min == 0 || self.date.min == 30)
      errors.add :date, 'El horario debe ser cada media hora'
    end
  end

  def after_today?
    if self.date < DateTime.now
      errors.add :date, 'La fecha no puede ser menor a hoy'
    end
  end

  def get_hour
    date.strftime("%H:%M")
  end

end

