class Appointment < ApplicationRecord
  belongs_to :schedule
  validates_presence_of :start_time, :end_time
  validates :start_time, numericality: {only_integer: true}
  validates :end_time, numericality: {only_integer: true, greater_than: :start_time}
  validates :start_time, :end_time, :overlap => {:scope => "schedule_id"}
end
