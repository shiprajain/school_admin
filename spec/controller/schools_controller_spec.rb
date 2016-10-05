require "rails_helper"

describe SchoolsController, :type => :controller do
	context "GET #index" do
		it "should renders all schools" do
    		# school = School.create
    		school = FactoryGirl.create(:school)
      		get :index
      		expect(assigns(:schools)).to eq([school])
  		end

  		it "should renders the index view" do
  			get :index
  			expect(response).to render_template("index")
  		end

  		it "should returns 200 http code" do
  			get :index
  			expect(response).to have_http_status(200)
  		end
	end

	context "GET #show" do
		it "should render the requested school" do
			school = FactoryGirl.create(:school)
			get :show, id: school
			expect(assigns(:school)).to eq (school)
		end

		it "should renders the show view" do
			get :show, id: FactoryGirl.create(:school)
			expect(response).to render_template("show")
		end
	end

	describe "POST #create" do


		context "with valid attributes" do
			it "should creates new school" do
				school_params = FactoryGirl.attributes_for(:school)
				p school_params
				expect {post :create, :school => school_params}.to change(School, :count).by(1)
				response.status.should eql (302)
			end

			it "should redirects to the new school" do
				post :create, school: FactoryGirl.attributes_for(:school)
				expect(response).to redirect_to School.last
			end

		end

		context "with invalid attributes" do
			it "should not crate new school" do
				school_invalid_params = FactoryGirl.attributes_for(:invalid_school)
				expect {post :create, :school => school_invalid_params}.to_not change(School, :count)
			end

			it "should rerender the same school action" do
				post :create, school: FactoryGirl.attributes_for(:invalid_school)
				expect(response).to render_template("new")
			end

		end
	end

	describe "PUT update" do
		
		before :each do
			@school = FactoryGirl.create(:school)
			@school_update_attributes = FactoryGirl.attributes_for(:school, name: 'KV121')
			@school_update_invalid_attributes = FactoryGirl.attributes_for(:school, name: nil)
		end

		context "with valid attributes" do
			it "should change the attributes for requested school" do
				put :update, id: @school, :school => @school_update_attributes
				@school.reload
				@school.name.should eql ('KV121')
			end

			it "should redirects to the updated school" do
				put :update, id: @school, :school => @school_update_attributes
				expect(response).to redirect_to @school
			end

		end

		context "with invlaid attributes" do
			it "should not change the attributes for requested school" do
				put :update, id: @school, :school => @school_update_invalid_attributes
				@school.reload
				@school.name.should eql('KV')
			end

			it "should rerenders the school's edit" do
				put :update, id: @school, :school => @school_update_invalid_attributes
				expect(response).to render_template("edit")
			end

		end
	end

	describe "DELETE destroy" do
		context "without any classroom" do
			before :each do
				@school = FactoryGirl.create(:school)
			end

			it "should count by -1" do
				expect{
					delete :destroy, id: @school}.to change(School, :count).by(-1)
			end

			it "should redirects to the schools index" do
				delete :destroy, id: @school
				expect(response).to redirect_to schools_path
			end
		end

		context "with classrooms" do
			before :each do
				@school = FactoryGirl.create(:school)
				@classroom1 = FactoryGirl.create(:classroom, :school_id => @school.id)
				@classroom2 = FactoryGirl.create(:classroom, :school_id => @school.id)
				# @student1 = FactoryGirl.create(:student, :school_id => @school.id, :classroom_id => @classroom1.id)
				# @student2 = FactoryGirl.create(:student, :school_id => @school.id, :classroom_id => @classroom2.id)
			end

			it "should destroy respected classrooms" do
				expect{
					delete :destroy, id: @school}.to change(School, :count).by(-1)
					expect(Classroom.count).to eql (0)
			end
		end

		context "with classrooms and studnets" do
			before :each do
				@school = FactoryGirl.create(:school)
				@classroom1 = FactoryGirl.create(:classroom, :school_id => @school.id)
				@classroom2 = FactoryGirl.create(:classroom, :school_id => @school.id)
				@student1 = FactoryGirl.create(:student, :school_id => @school.id, :classroom_id => @classroom1.id)
				@student2 = FactoryGirl.create(:student, :school_id => @school.id, :classroom_id => @classroom2.id)
			end

			it "should destroy respected classrooms" do
				expect{
				delete :destroy, id: @school}.to change(School, :count).by(-1)
				expect(Classroom.count).to eql (0)
				expect(Student.count).to eql (0)
			end
		end
	end
end

