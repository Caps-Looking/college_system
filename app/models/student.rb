class Student < ApplicationRecord
    has_one :grade, dependent: :destroy

    validates :name, presence: true, length: { minimum: 10 }
    validates :age, presence: true, numericality: { greater_than_or_equal_to: 18 }
    validates :course, presence: true
end
