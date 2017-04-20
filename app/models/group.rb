class Group < ApplicationRecord
  has_many :students
  validates :name, presence: true, length: { minimum: 3}
end
