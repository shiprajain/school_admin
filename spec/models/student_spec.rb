require 'rails_helper'

describe Student, :type => :model do
	context "validations " do
		it { should validate_presence_of(:name) }
		it { should_not validate_presence_of(:marks) }
		it { should validate_presence_of(:address) }
		it { should validate_presence_of(:city) }
		it { should_not validate_presence_of(:zip) }
		it { should validate_presence_of(:state) }
		it { should validate_presence_of(:school_id) }
		it { should validate_presence_of(:classroom_id) }
		it { should validate_numericality_of(:zip) }
		it { should validate_numericality_of(:marks) }
		it { should_not allow_value('232#@').for(:zip) }
		it { should_not allow_value('kjdsfj').for(:zip) }
		it { should_not allow_value('242124445').for(:zip) }
		it { should_not allow_value('101').for(:marks) }
		it { should allow_value('100').for(:marks) }
		it { should allow_value('0').for(:marks) }
	end
end