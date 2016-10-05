class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.integer :marks
      t.string :address
      t.string :city
      t.string :zip
      t.string :state

      t.timestamps null: false
    end
  end
end
