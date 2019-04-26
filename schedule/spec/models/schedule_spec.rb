require 'rails_helper'

RSpec.describe Schedule, type: :model do
  # check that schedule has a one-to-many relationship with Appointment model
  it {should have_many(:appointments).dependent(:destroy)}
end