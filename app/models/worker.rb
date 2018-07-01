class Worker < ApplicationRecord
  has_many :shifts, dependent: :destroy

  validates :first_name, :last_name, :full_name, :status, :details, presence: true
end
