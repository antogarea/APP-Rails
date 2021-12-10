class Appointment < ApplicationRecord
  #Con esto se crea la asociacion con professional
  belongs_to :professional

  validates :name, :surname, :phone, :date, presence: true
  validates :notes, length: { maximum: 50}
  validates :phone, numericality: { only_integer: true }
end
