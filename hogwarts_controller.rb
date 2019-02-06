require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')

require_relative('models/student.rb')
require_relative('models/house.rb')
also_reload('models/*')

get '/hogwarts/student-index' do
  @students = Student.all()
  erb(:student_index)
end

get '/hogwarts/student-new' do
  erb(:new)
end

post '/hogwarts/student-index' do
  @student = Student.new(params)
  @student.save()
  erb(:create)
end

get '/hogwarts/house-index' do
  @houses = House.all()
  erb(:house_index)
end
