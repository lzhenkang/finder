class Comment < ApplicationRecord
  # AR classes are singular and capitalized by convention
    has_one :user
    has_one :appointment
end