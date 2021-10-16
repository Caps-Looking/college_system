class Assessment < ApplicationRecord
  after_initialize :default_values

  private
    def default_values
      self.test1 ||= 0
      self.test2 ||= 0
      self.test3 ||= 0
    end
end
