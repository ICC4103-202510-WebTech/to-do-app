class Task < ApplicationRecord
  belongs_to :project
  belongs_to :user

  validates :name, presence: true
  validates :description, presence: true
  validates :status, presence: true
end
