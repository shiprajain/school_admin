
class Teacher < ActiveRecord::Base
	belongs_to :school
	has_and_belongs_to_many :classrooms
	has_and_belongs_to_many :students
	has_one :subject

	validates :name, presence: true
	validates :gender, presence: true, inclusion: [ 'male', 'female' ]
	validates :proficiency, presence: true, :numericality => false
	validates :phone_no, presence: true, :uniqueness => true, :numericality => true
	validates_length_of :phone_no, :in => 7..10
	validates :school_id, presence: true
end
