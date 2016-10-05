class AddSubjectIdInTeachers < ActiveRecord::Migration
  def change
  	add_column :teachers, :subject_id, :integer, :null => false
  end
end
