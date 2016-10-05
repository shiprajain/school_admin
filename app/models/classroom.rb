class Classroom < ActiveRecord::Base
	belongs_to :school
	has_and_belongs_to_many :teachers
	has_many :students, dependent: :destroy
	has_and_belongs_to_many :subjects

	validates :name, presence: true, uniqueness: true
	validates :no_of_students, numericality: { only_integer: true, :greater_than => 0, :less_than_or_equal_to => 100 }, allow_blank: true
	validates :school_id, presence: true
end
