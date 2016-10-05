class CreateClassroomsSubjects < ActiveRecord::Migration
  def change
    create_table :classrooms_subjects do |t|

    	t.integer :classroom_id, :null => false
    	t.integer :subject_id, :null => false
    end
  end
end
