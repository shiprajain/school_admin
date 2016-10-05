@school1 = School.create(name: "school1", address: "vijaypath nagar", city: "Udaipur", zip: "123456", phone_no: "1234543217")
@school2 = School.create(name: "school2", address: "mansarovar", city: "Jaipur", zip: "123498", phone_no: "987654320")
@school3 = School.create(name: "school3", address: "vijaypath", city: "Indore", zip: "125456", phone_no: "1234543564")
			

Classroom.create(name: "classroom232", no_of_students: 45, school_id: 9)
Classroom.create(name: "classroom231", no_of_students: 55, school_id: 9)
Classroom.create(name: "classroom233", no_of_students: 87, school_id: 10)
Classroom.create(name: "classroom234", no_of_students: 30, school_id: 9)

Teacher.create(name: "teacher1", gender: "male", phone_no: "4353242531", proficiency: "Mathematics", school_id: "1", subject_id: "1")
Teacher.create(name: "teacher2", gender: "female", phone_no: "4353242343", proficiency: "Mathematics", school_id: "1", subject_id: "1")

Student.create(name: "student1", marks: 99, address: "2/101, malviya nagar", city: "jaipur", zip: "302013", state: "rajasthan", school_id: "1", classroom_id: "1")
Student.create(name: "student2", marks: 100, address: "2/102, malviya nagar", city: "jaipur", zip: "302113", state: "rajasthan", school_id: "1", classroom_id: "1")