require_relative('../db/sql_runner')

class House

  attr_reader :id
  attr_accessor :name

  def initialize( options )
    @id = options['id'].to_i
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO houses
    (name)
    VALUES ($1)
    RETURNING *"
    values = [@name]
    house = SqlRunner.run(sql, values)
    @id = house.first['id'].to_i
  end

  def House.all()
    sql = "SELECT * FROM houses"
    houses = SqlRunner.run(sql)
    result = houses.map { |house| House.new(house)}
    return result
  end

  def House.find(id)
    sql = "SELECT * FROM houses WHERE id = $1"
    values = [id]
    houses = SqlRunner.run(sql, values)
    result = House.new(houses.first)
    return result
  end

  def House.delete_all()
    sql = "DELETE FROM houses"
    SqlRunner.run(sql)
  end

  def House.map_items(data)
    result = data.map{|house| House.new(house)}
    return result
  end

end
