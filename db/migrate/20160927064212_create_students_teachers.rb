class CreateStudentsTeachers < ActiveRecord::Migration
  def change
    create_table :students_teachers do |t|

    	t.integer :student_id, :null => false
    	t.integer :teacher_id, :null => false
    end
  end
end
