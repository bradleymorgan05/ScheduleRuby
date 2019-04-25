class Schedule < ApplicationRecord
  has_many :appointments, dependent: :destroy
end
