class Shift < ApplicationRecord
  belongs_to :worker

  validates :start_date, presence: true
end
