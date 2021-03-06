class Group < ApplicationRecord
  has_and_belongs_to_many :events
  has_and_belongs_to_many :students
  validates :name, presence: true, length: { minimum: 3}
end
