require_relative('../models/student.rb')

student_1 = Student.new({
  "first_name" => "Bob",
  "second_name" => "Dylan",
  "house" => "Slytherin",
  "age" => 55
  })

student_2 = Student.new({
  "first_name" => "Michael",
  "second_name" => "Creed",
  "house" => "Hufflepuff",
  "age" => 12
  })

student_1.save()
student_2.save()

Student.all()
