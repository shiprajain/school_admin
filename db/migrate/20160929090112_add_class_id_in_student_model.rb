class AddClassIdInStudentModel < ActiveRecord::Migration
  def change
  	add_column :students, :classroom_id, :integer, :null => false
  end
end
