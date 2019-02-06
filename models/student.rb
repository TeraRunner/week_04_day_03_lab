require_relative('../db/sql_runner.rb')

class Student

  attr_reader :id
  attr_accessor :first_name, :second_name, :house, :age

  def initialize(options)
    @id = options['id'].to_i
    @first_name = options['first_name']
    @second_name = options['second_name']
    @house = options['house']
    @age = options['age'].to_i
  end

  def pretty_name()
    return "#{@first_name} #{@second_name}"
  end

  def save()
    sql = "INSERT INTO students
    (first_name, second_name, house, age)
    VALUES ($1, $2, $3, $4)
    RETURNING *"
    values = [@first_name, @second_name, @house, @age]
    student = SqlRunner.run(sql, values)
    @id = student.first['id'].to_i
  end

  def Student.all()
    sql = "SELECT * FROM students"
    students = SqlRunner.run(sql)
    result = students.map { |student| Student.new(student)}
    return result
  end

  def Student.find(id)
    sql = "SELECT * FROM students WHERE id = $1"
    values = [id]
    students = SqlRunner.run(sql, values)
    result = Student.new(students.first)
    return result
  end

  def Student.delete_all()
    sql = "DELETE FROM students"
    SqlRunner.run(sql)
  end

end
