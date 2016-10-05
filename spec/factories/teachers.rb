
FactoryGirl.define do
	factory :teacher do
		name "Ramlal"
		gender "male"
		phone_no { rand(10**10) }
		proficiency "Mathematics"
		school_id ""
		subject_id ""
		classrooms {[FactoryGirl.create(:classroom)]}
	end
end