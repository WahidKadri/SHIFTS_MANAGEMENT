class Worker < ApplicationRecord
  has_many :shifts

  validates :first_name, :last_name, :status, presence: true
end
