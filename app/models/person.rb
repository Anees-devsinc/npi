class Person < ApplicationRecord
    validates_uniqueness_of :npi_number
end
