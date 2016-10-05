require 'rails_helper'

describe Teacher, :type => :model do
	context "validations " do
		it { should validate_presence_of(:name) }
		it { should validate_presence_of(:gender) }
		it { should validate_presence_of(:phone_no) }
		it { should validate_presence_of(:proficiency) }
	end
end