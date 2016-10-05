class CreateStudentsSubjects < ActiveRecord::Migration
  def change
    create_table :students_subjects do |t|

    	t.integer :student_id, :null => false
    	t.integer :subject_id, :null => false
    end
  end
end
