require 'rails_helper'

describe School, :type => :model do

	context "validations.." do

		it { should validate_presence_of(:name) }
		it { should validate_presence_of(:address) }
		it { should validate_presence_of(:city) }
		it { should validate_presence_of(:phone_no) }
		it { should_not allow_value('3473453734 34').for(:name) }
		it { should allow_value('sch1').for(:name) }
		it { should validate_numericality_of(:zip) }
		it { should validate_numericality_of(:phone_no) }
		it { should validate_length_of(:phone_no).is_at_least(7) }
		it { should validate_length_of(:phone_no).is_at_most(10)}
		it { should allow_value('5453234').for(:phone_no) }
		it { should allow_value('454567564').for(:phone_no) }
		it { should allow_value('4545675699').for(:phone_no) }
		it { should_not allow_value('23456781234').for(:phone_no) }
		it { should_not allow_value('234567').for(:phone_no) }
		it { should_not allow_value('1321321$#df').for(:phone_no) }
		it { should_not allow_value('74dgsdgdsh').for(:phone_no) }
		it { should_not allow_value('232#@').for(:zip) }
		it { should_not allow_value('kjdsfj').for(:zip) }
		it { should_not allow_value('242124445').for(:zip) }
		it { should validate_uniqueness_of(:phone_no)}

	end


	context "with correct attributes" do

		it 'should create the school' do
			create(:school).should be_valid
		end
	end

	context "uniqueness validation" do
		before do
			create(:school, :phone_no => "1234543278")
		end

		it "should fail uniqueness of phone_no" do
			build(:school, :phone_no => "1234543278").should_not be_valid
		end
	end
end