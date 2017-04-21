class Event < ApplicationRecord
  has_and_belongs_to_many :groups
  validates :name, presence: true, length: { minimum: 3}
  validates :date, presence: true, length: { minimum: 3}
end
