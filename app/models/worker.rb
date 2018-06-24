class Worker < ApplicationRecord
  has_many :shifts

  validates :first_name, :status, presence: true
end
