class AddSchoolIdAndTeacherIdInSubjetModel < ActiveRecord::Migration
  def change
  	add_column :subjects, :school_id, :integer, :null => false
  	add_column :subjects, :teacher_id, :integer, :null => false
  end
end
