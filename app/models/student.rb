class Student < ApplicationRecord
  validates :first_name, presence: true, length: { minimum: 3}
  validates :surname, presence: true, length: { minimum: 3}
end
