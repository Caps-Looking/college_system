class Grade < ApplicationRecord
  belongs_to :student

  validates :test1, presence: true
  validates :test2, presence: true
  validates :test3, presence: true
  validates :exam, presence: true

  private
    def default_values
      self.test1 ||= 0
      self.test2 ||= 0
      self.test3 ||= 0
      self.exam ||= 0
    end
end
