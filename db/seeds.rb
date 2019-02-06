require_relative('../models/student')
require_relative('../models/house')

House.delete_all()
Student.delete_all()

house1 = House.new({
  'name' => 'Gryffindor'
})
house1.save

house2 = House.new({
  'name' => 'Slytherin'
})
house2.save

student_1 = Student.new({
  "first_name" => "Bob",
  "second_name" => "Dylan",
  "house_id" => house1.id,
  "age" => 55
})
student_1.save()

student_2 = Student.new({
  "first_name" => "Michael",
  "second_name" => "Creed",
  "house_id" => house2.id,
  "age" => 12
  })
student_2.save()
