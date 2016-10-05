
require "rails_helper"

describe TeachersController, :type => :controller do
	context "GET #index" do
		it "should renders all teachers" do
	    	school = FactoryGirl.create(:school)
		    classroom1 = FactoryGirl.create(:classroom, name: "classroom1", :school_id => school.id)
		    classroom2 = FactoryGirl.create(:classroom, name: "classroom2", :school_id => school.id)
		    teacher1 = FactoryGirl.create(:teacher, :school_id => school.id, :subject_id => "1", :classroom_ids => [classroom1.id])
	    	teacher2 = FactoryGirl.create(:teacher, name: "teacher2", :school_id => school.id, :subject_id => "1", :classroom_ids => [classroom2.id])

	     	get :index
	     	# p assigns(:teachers)
	     	p 
	    	expect(assigns(:teachers)).to eq([teacher1, teacher2])
  		end

	  	it "should renders the index view" do
	  		get :index
			expect(response).to render_template("index")
	 	end
  	end

  	context "GET #show" do
  		before :each do
  			@school = FactoryGirl.create(:school)
		    @classroom1 = FactoryGirl.create(:classroom, name: "classroom1", :school_id => @school.id)
		    @classroom2 = FactoryGirl.create(:classroom, name: "classroom2", :school_id => @school.id)
		    @teacher1 = FactoryGirl.create(:teacher, :school_id => @school.id, :subject_id => "1", :classroom_ids => [@classroom1.id])
		end

  		it "should show the requested record" do
  			get :show, id: @teacher1
  			expect(assigns(:teacher)).to eql (@teacher1)
  		end

  		it "should renders the show view" do
  			get :show, id: @teacher1
  			expect(response).to render_template("show")
  		end
	end

	describe "POST #create" do
		context "with valid attributes" do

			before :each do
				@school = FactoryGirl.create(:school)
			    @classroom1 = FactoryGirl.create(:classroom, name: "classroom1", :school_id => @school.id)
			    @classroom2 = FactoryGirl.create(:classroom, name: "classroom2", :school_id => @school.id)
			    @teacher_params = FactoryGirl.attributes_for(:teacher, :school_id => @school.id, :subject_id => "1", :classroom_ids => [@classroom1.id, @classroom2.id])
			end

			it "should create new teacher" do
				expect{
					post :create, :teacher => @teacher_params}.to change(Teacher, :count).by(1)
					p Teacher.last
			end

			it "should redirects to the last teacher" do
				post :create, :teacher => @teacher_params
				expect(response).to redirect_to Teacher.last
			end
		end

		context "with invalid attributes" do

			before :each do
				@school = FactoryGirl.create(:school)
			    @classroom1 = FactoryGirl.create(:classroom, name: "classroom1", :school_id => @school.id)
			    @classroom2 = FactoryGirl.create(:classroom, name: "classroom2", :school_id => @school.id)
			    @teacher_invalid_params = FactoryGirl.attributes_for(:teacher, :name => nil, :school_id => @school.id, :subject_id => "1", :classroom_ids => [@classroom1.id, @classroom2.id])
			    p @teacher_invalid_params
			end

			it "should not create new teacher" do
				expect{
					post :create, :teacher => @teacher_invalid_params}.to change(Teacher, :count).by(0)
			end

			it "should render the new template" do
				post :create, :teacher => @teacher_invalid_params
				expect(response).to render_template("new")
			end
		end
	end

	describe "PUT #update" do

		before :each do
				@school = FactoryGirl.create(:school)
			    @classroom1 = FactoryGirl.create(:classroom, name: "classroom1", :school_id => @school.id)
			    @classroom2 = FactoryGirl.create(:classroom, name: "classroom2", :school_id => @school.id)
			    @teacher = FactoryGirl.create(:teacher, :name => "teacher1", :school_id => @school.id, :subject_id => "1", :classroom_ids => [@classroom1.id, @classroom2.id])
			    @teacher_update_params = FactoryGirl.attributes_for(:teacher, :name => "Gyanji", :school_id => @school.id, :subject_id => "1", :classroom_ids => [@classroom1.id, @classroom2.id])
			    @teacher_update_invalid_params = FactoryGirl.attributes_for(:teacher, :name => nil, :school_id => @school.id, :subject_id => "1", :classroom_ids => [@classroom1.id, @classroom2.id])
			end

		context "with valid parameters" do
			it "should update the attributes" do
				put :update, id: @teacher, :teacher => @teacher_update_params
				@teacher.reload
				@teacher.name.should eql ("Gyanji")
			end

			it "should redirects to the last teacher" do
				put :update, id: @teacher, :teacher => @teacher_update_params
				@teacher.reload
				expect(response).to redirect_to @teacher
			end
		end

		context "with invalid parameters" do
			it "should not update the attributes" do
				put :update, id: @teacher, :teacher => @teacher_update_invalid_params
				@teacher.reload
				@teacher.name.should eql ("teacher1")
			end

			it "should redirects to the last teacher" do
				put :update, id: @teacher, :teacher => @teacher_update_invalid_params
				@teacher.reload
				expect(response).to render_template("edit")
			end
		end
	end

	describe "DELETE #destroy" do
		before :each do
			@school = FactoryGirl.create(:school)
		    @classroom1 = FactoryGirl.create(:classroom, name: "classroom1", :school_id => @school.id)
		    @classroom2 = FactoryGirl.create(:classroom, name: "classroom2", :school_id => @school.id)
		    @teacher = FactoryGirl.create(:teacher, :name => "teacher1", :school_id => @school.id, :subject_id => "1", :classroom_ids => [@classroom1.id, @classroom2.id])
		end

		it "should destroy the teacher" do
			expect {
			delete :destroy, id: @teacher}.to change(Teacher, :count).by(-1)

		end

		it "should redirect to index url" do
			delete :destroy, id: @teacher
			expect(response).to redirect_to teachers_path
		end
	end
end