class Export
  include ActiveModel::Validations
  include ActiveModel::Model

  attr_accessor :professional, :date, :type

  validates :date, :type, presence: true
end