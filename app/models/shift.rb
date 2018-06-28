class Shift < ApplicationRecord
  belongs_to :worker, optional: true

  validates :start_date, presence: true
  validates :start_date, uniqueness: { scope: :worker_id,
    message: "-This worker is already on a schedule, please choose another" }, if: Proc.new { |tbl| !tbl.worker_id.nil? }
end
