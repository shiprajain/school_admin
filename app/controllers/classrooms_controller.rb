class ClassroomsController < ApplicationController

	def index
		@classrooms = Classroom.all
		p "hello"
	end

	def index_by_school
		@classrooms = School.find(params[:school_id]).classrooms
	end
	
	def show
		@classroom = Classroom.find(params[:id])
	
	end

	# def new_under_school
	# 	@classroom = Classroom.new
	# end

	def new
		@classroom = Classroom.new
	end

	def edit
		@classroom = Classroom.find(params[:id])
	end


	def create
		@classroom = Classroom.new(classroom_params)

		if @classroom.save
			redirect_to @classroom
		else
			render "new"
		end
	end

	def update
		@classroom = Classroom.find (params[:id])

		if @classroom.update(classroom_params)
			redirect_to @classroom
		else
			render "edit"
		end
	end

	def destroy
		@classroom = Classroom.find {params[:id]}
		@classroom.destroy
		redirect_to classrooms_path
	end

	private

	def classroom_params
		params.require(:classroom).permit(:name, :no_of_students, :school_id)
	end



end
