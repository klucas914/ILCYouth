class Event < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3}
  validates :date, presence: true, length: { minimum: 3}
end
