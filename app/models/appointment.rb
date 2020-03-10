class Appointment < ApplicationRecord
  # AR classes are singular and capitalized by convention
    belongs_to :user
    has_one :accepted_appointment
end