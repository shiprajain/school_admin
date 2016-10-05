require "rails_helper"

describe ClassroomsController, :type => :controller do
	context "GET #index" do
		it "should renders all classrooms" do
    	school = FactoryGirl.create(:school)
      classroom1 = FactoryGirl.create(:classroom, name: "classroom1", :school_id => school.id)
      classroom2 = FactoryGirl.create(:classroom, name: "classroom2", :school_id => school.id)
      classroom3 = FactoryGirl.create(:classroom, name: "classroom3", :school_id => school.id)
     	get :index
    	expect(assigns(:classrooms)).to eq([classroom1, classroom2, classroom3])
  	end

  	it "should renders the index view" do
  		get :index
			expect(response).to render_template("index")
 		end

  end

  context "GET #show" do

    before :each do
      school = FactoryGirl.create(:school)
      @classroom1 = FactoryGirl.create(:classroom, name: "classroom1", :school_id => school.id)
      @classroom2 = FactoryGirl.create(:classroom, name: "classroom2", :school_id => school.id)
    end

    it "should requested classroom" do
      
      get :show, id: @classroom2
      expect(assigns(:classroom)).to eq(@classroom2)
    end

    it "should renders the show view" do
      get :show, id: @classroom1
      expect(response).to render_template("show")
    end
  end

  describe "POST #create" do

    context "with walid parametrs" do
      before :each do
        school = FactoryGirl.create(:school)
        @classroom_params = FactoryGirl.attributes_for(:classroom, :school_id => school.id)
      end

      it "should create new classroom" do
        expect {
          post :create, :classroom => @classroom_params}.to change(Classroom, :count).by(1)
      end

      it "should redirect to new classroom" do
        post :create, :classroom => @classroom_params
        expect(response).to redirect_to Classroom.last
      end
    end

    context "with invalid parameters" do

      before :each do
        school = FactoryGirl.create(:school)
        @classroom_invalid_params = FactoryGirl.attributes_for(:classroom, name: nil, :school_id => school.id)
      end
      
      it "should not create new classroom" do
        expect {
        post :create, :classroom => @classroom_invalid_params }.to change(Classroom, :count).by(0)
      end

      it "should rerenders the new action" do
        post :create, :classroom => @classroom_invalid_params
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    before :each do
      @school = FactoryGirl.create(:school)
      @classroom = FactoryGirl.create(:classroom, :school_id => @school.id)
      @classroom_update_params = FactoryGirl.attributes_for(:classroom, no_of_students: 90, school_id: @school.id)
      @classroom_update_invalid_params = FactoryGirl.attributes_for(:classroom, name: nil, school_id: @school.id)
    end

    context "with valid parameters" do

      it "should update the attributes" do
        put :update, id: @classroom, :classroom => @classroom_update_params
        @classroom.reload
        @classroom.no_of_students.should eql (90)
      end

      it "should redirect the last classroom" do
        put :update, id: @classroom, :classroom => @classroom_update_params
        expect(response).to redirect_to @classroom
      end
    end

    context "with invalid parameters" do
      it "should not update the attributes" do
        put :update, id: @classroom, :classroom => @classroom_update_invalid_params
        @classroom.reload
        @classroom.name.should eql ("eleventh")
        @classroom.no_of_students.should eql (50)
      end

      it "should rerenders the classroom edit" do
        put :update, id: @classroom, :classroom => @classroom_update_invalid_params
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do

    context "without any students" do
      before :each do
        @school = FactoryGirl.create(:school)
        @classroom = FactoryGirl.create(:classroom, :school_id => @school.id)
      end

      it "should destroy the classrooms" do
        expect {
          delete :destroy, id: @classroom}.to change(Classroom, :count).by(-1)
      end

      it "should render the index url" do
        delete :destroy, id: @classroom
        expect(response).to redirect_to classrooms_path
      end
    end

    context "with students" do
      before :each do
        @school = FactoryGirl.create(:school)
        @classroom = FactoryGirl.create(:classroom, :school_id => @school.id)
        @student = FactoryGirl.create(:student, :school_id => @school.id, :classroom_id => @classroom.id)
      end

      it "should delete the classrooms" do
        expect {
          delete :destroy, id: @classroom}.to change(Classroom, :count).by(-1)
          expect(Student.count).to eql(0)
      end

    end

  end
end
