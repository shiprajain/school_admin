class School < ActiveRecord::Base
	has_many :classrooms, dependent: :destroy
	has_many :teachers, dependent: :destroy
	has_many :students, dependent: :destroy
	has_many :subjects, dependent: :destroy

	validates :name, presence: true, :format => {:with => /[a-zA-Z]/}
	validates :phone_no, presence: true, :uniqueness => true, :numericality => true
	validates_length_of :phone_no, :in => 7..10
	validates :address, presence: true
	validates :city, presence: true
	validates :zip, allow_nil: true, :numericality => true, length: {is: 6}
end
