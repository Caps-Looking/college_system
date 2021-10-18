class Assessment < ApplicationRecord
  after_initialize :default_values
  validates :test1, presence: true
  validates :test2, presence: true
  validates :test3, presence: true

  private
    def default_values
      self.test1 ||= 0
      self.test2 ||= 0
      self.test3 ||= 0
    end
end
