class AddSchoolIdInAllModel < ActiveRecord::Migration
  def change
  	add_column :students, :school_id, :integer, :null => false
  	add_column :classrooms, :school_id, :integer, :null => false
  	add_column :teachers, :school_id, :integer, :null => false
  	
  end
end
