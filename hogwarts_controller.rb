require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')

require_relative('models/student.rb')
also_reload('models/*')

get '/hogwarts/student-index' do
  @students = Student.all()
  erb(:student_index)
end

get '/hogwarts/new' do
  erb(:new)
end

post '/hogwarts/student-index' do
  @student = Student.new(params)
  @student.save()
  erb(:create)
end
