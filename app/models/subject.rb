class Subject < ActiveRecord::Base
	belongs_to :school
	belongs_to :teacher
	has_and_belongs_to_many :classrooms
	has_and_belongs_to_many :students

	validates :school_id, presence: true
	validates :teacher_id, presence: true

end
