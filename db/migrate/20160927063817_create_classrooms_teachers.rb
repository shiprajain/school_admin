class CreateClassroomsTeachers < ActiveRecord::Migration
  def change
    create_table :classrooms_teachers do |t|

    	t.integer :classroom_id, :null => false
    	t.integer :teacher_id, :null => false

    end
  end
end
