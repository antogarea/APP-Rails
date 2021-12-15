class Professional < ApplicationRecord
  has_many :appointments, dependent: :destroy
  validates :name, presence: true, length: { maximum: 20}

  def to_s
    name
  end

  def cancel_all
    self.appointments.where("date > ?", DateTime.now).destroy_all
  end

end
