require 'rails_helper'

describe Classroom, :type => :model do
	context "validations " do
		it { should validate_presence_of(:name) }
		it { should validate_numericality_of(:no_of_students).only_integer }
		it { should_not validate_presence_of(:no_of_students) }
		it { should allow_value('1').for(:no_of_students) }
		it { should allow_value('90').for(:no_of_students) }
		it { should allow_value('99').for(:no_of_students) }
		it { should_not allow_value('101').for(:no_of_students) }
		it { should_not allow_value('0').for(:no_of_students) }
		it { should validate_presence_of(:school_id) }

	end

	context "name uniqueness validation" do
		before do
			create(:classroom, :name => "10", school_id: "1")
		end

		it "should fail" do
			build(:classroom, :name => "10", school_id: "1").should_not be_valid
		end
	end

end
