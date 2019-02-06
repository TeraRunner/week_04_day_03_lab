require_relative('../models/student')
require_relative('../models/house')

House.delete_all()
Student.delete_all()

student_1 = Student.new({
  "first_name" => "Bob",
  "second_name" => "Dylan",
  "house" => "Gryffindor",
  "age" => 55
})
student_1.save()

student_2 = Student.new({
  "first_name" => "Michael",
  "second_name" => "Creed",
  "house" => "Slytherin",
  "age" => 12
  })
student_2.save()

house1 = House.new({
  'name' => 'Gryffindor'
  # 'logo' => '2017-01-08 04:00:00',
})
house1.save

house2 = House.new({
  'name' => 'Slytherin'
  # 'logo' => '2017-01-08 04:00:00',
})
house2.save
