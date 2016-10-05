require "rails_helper"

describe StudentsController, :type => :controller do
	context "GET #index" do
		it "should renders all students" do
    	school = FactoryGirl.create(:school)
      classroom1 = FactoryGirl.create(:classroom, name: "classroom1", :school_id => school.id)
      classroom2 = FactoryGirl.create(:classroom, name: "classroom2", :school_id => school.id)
      student1 = FactoryGirl.create(:student, name: "student1", :school_id => school.id, :classroom_id => classroom1.id)
      student2 = FactoryGirl.create(:student, name: "student2", :school_id => school.id, :classroom_id => classroom2.id)
     	get :index
    	expect(assigns(:students)).to eq([student1, student2])
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
        @student1 = FactoryGirl.create(:student, name: "student1", :school_id => @school.id, :classroom_id => @classroom1.id)
      end

      it "should requested student" do
        get :show, id: @student1
        expect(assigns(:student)).to eql(@student1)
      end

      it "renders the show template" do
        get :show, id: @student1
        expect(response).to render_template("show")
      end
    end

    describe "POST #create" do

      before :each do
        @school = FactoryGirl.create(:school)
        @classroom1 = FactoryGirl.create(:classroom, name: "classroom1", :school_id => @school.id)
      end

      context "with valid attributes" do
        it "should add new student" do
          student_params = FactoryGirl.attributes_for(:student, :school_id => @school.id, :classroom_id => @classroom1.id)
          expect {
            post :create, :student => student_params}.to change(Student, :count).by(1)
        end

        it "should redirect to new student" do
          student_params = FactoryGirl.attributes_for(:student, :school_id => @school.id, :classroom_id => @classroom1.id)
          post :create, :student => student_params
          expect(response).to redirect_to Student.last
        end
      end

      context "with invalid attributes" do
        it "should not add new student" do
          student_invalid_params = FactoryGirl.attributes_for(:student, name: nil, :school_id => @school.id, :classroom_id => @classroom1.id)
          expect {
            post :create, :student => student_invalid_params}.to change(Student, :count).by(0)
        end

        it "should rerenders the new action" do
          post :create, :student => @student_invalid_params
          expect(response).to render_template("new")
        end
      end
    end

    describe "PUT #update" do

      before :each do
        @school = FactoryGirl.create(:school)
        @classroom = FactoryGirl.create(:classroom, :school_id => @school.id)
        @student = FactoryGirl.create(:student, name: "nikki", city: "Jaipur", :school_id => @school.id, :classroom_id => @classroom.id)
        @student_update_params = FactoryGirl.attributes_for(:student, name: "shipra", city: "Udaipur", :school_id => @school.id, :classroom_id => @classroom.id)
        @student_update_invalid_params = FactoryGirl.attributes_for(:student, name: nil, :school_id => @school.id, :classroom_id => @classroom.id)
      end

      context "with valid parameters" do

      it "should update the attributes" do
        put :update, id: @student, :student => @student_update_params
        @student.reload
        @student.name.should eql ("shipra")
        @student.city.should eql ("Udaipur")
      end

      it "should redirect the last student" do
        put :update, id: @student, :student => @student_update_params
        expect(response).to redirect_to @student
      end
    end

    context "with invalid parameters" do
      it "should not update the attributes" do
        put :update, id: @student, :student => @student_update_invalid_params
        @student.reload
        @student.city.should eql ("Jaipur")
        @student.name.should eql ("nikki")
      end

      it "should rerenders the student edit" do
        put :update, id: @student, :student => @student_update_invalid_params
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    before :each do
      @school = FactoryGirl.create(:school)
      @classroom = FactoryGirl.create(:classroom, :school_id => @school.id)
      @student = FactoryGirl.create(:student, :school_id => @school.id, :classroom_id => @classroom.id)
    end

    it "should destroy the student" do
      expect{
      delete :destroy, id: @student}.to change(Student, :count).by(-1)
    end 

    it "should redirects to index url" do
      delete :destroy, id: @student
      expect(response).to redirect_to students_path
    end
  end
end
