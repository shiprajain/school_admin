class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.integer :marks

      t.timestamps null: false
    end
  end
end
