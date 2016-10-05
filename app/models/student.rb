class Student < ActiveRecord::Base
	belongs_to :school
	has_and_belongs_to_many :teachers
	belongs_to :classroom
	has_and_belongs_to_many :subjects

	validates :name, presence: true, :format => {:with => /[a-zA-Z]/}
	validates :address, presence: true
	validates :city, presence: true, :numericality => false
	validates :state, presence: true, :numericality => false
	validates :zip, allow_nil: true, :numericality => true, length: {is: 6}
	validates :marks, allow_nil: true, numericality: { only_integer: true, :less_than_or_equal_to => 100}
	validates :school_id, presence: true
	validates :classroom_id, presence: true
end
