class Project < ApplicationRecord
  has_many :tasks, dependent: :destroy

  validates :name, presence: true

  before_validation :strip_name
  before_validation :titleize_name

  private
    def strip_name
      self.name = name.strip
    end

    def titleize_name
      self.name = name.titleize
    end
end
