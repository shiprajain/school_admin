
FactoryGirl.define do
	factory :school do
		name "KV"
		phone_no "1234567456" # phone_no { rand(10**10) }
		address "malviya nagar"
		city "Delhi"
		zip "330111"
	end

	factory :invalid_school, parent: :school do
		name nil
	end
end