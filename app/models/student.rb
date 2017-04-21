class Student < ApplicationRecord
  has_and_belongs_to_many :groups
  validates :first_name, presence: true, length: { minimum: 3}
  validates :surname, presence: true, length: { minimum: 3}
end
