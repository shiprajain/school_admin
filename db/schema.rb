
ActiveRecord::Schema.define(version: 20160929103057) do

  enable_extension "plpgsql"

  create_table "classrooms", force: :cascade do |t|
    t.string   "name"
    t.integer  "no_of_students"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "school_id",      null: false
  end

  create_table "classrooms_subjects", force: :cascade do |t|
    t.integer "classroom_id", null: false
    t.integer "subject_id",   null: false
  end

  create_table "classrooms_teachers", force: :cascade do |t|
    t.integer "classroom_id", null: false
    t.integer "teacher_id",   null: false
  end

  create_table "schools", force: :cascade do |t|
    t.string   "name"
    t.string   "phone_no"
    t.string   "address"
    t.string   "city"
    t.string   "zip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.string   "name"
    t.integer  "marks"
    t.string   "address"
    t.string   "city"
    t.string   "zip"
    t.string   "state"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "school_id",    null: false
    t.integer  "classroom_id", null: false
  end

  create_table "students_subjects", force: :cascade do |t|
    t.integer "student_id", null: false
    t.integer "subject_id", null: false
  end

  create_table "students_teachers", force: :cascade do |t|
    t.integer "student_id", null: false
    t.integer "teacher_id", null: false
  end

  create_table "subjects", force: :cascade do |t|
    t.integer  "marks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "school_id",  null: false
    t.integer  "teacher_id", null: false
  end

  create_table "teachers", force: :cascade do |t|
    t.string   "name"
    t.string   "gender"
    t.string   "phone_no"
    t.string   "proficiency"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "school_id",   null: false
    t.integer  "subject_id",  null: false
  end

end
