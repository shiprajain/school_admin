class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :name
      t.string :gender
      t.string :phone_no
      t.string :proficiency

      t.timestamps null: false
    end
  end
end
