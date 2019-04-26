require 'rails_helper'

RSpec.describe Appointment, type: :model do
  # check that appointment belongs to a single schedule
  it {should belong_to(:schedule)}
  it {should validate_presence_of(:start_time)}
  it {should validate_presence_of(:end_time)}
end