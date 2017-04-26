class Runtime < ApplicationRecord
  belongs_to :mrpjob

  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :date, presence: true
  validates :mrpjob_id, presence: true
end
