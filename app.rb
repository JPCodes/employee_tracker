require('sinatra')
require('sinatra/reloader')
require('sinatra/activerecord')
also_reload('lib/**/*.rb')
require('./lib/division')
require('./lib/employee')
require('./lib/project')
require('pg')

get('/') do
  erb(:index)
end

get('/hr_manager') do
  erb(:hr_manager)
end


get('/divisions') do
  @all_divisions = Division.all()
  erb(:divisions)
end

post('/divisions_form') do
  name = params.fetch('name')
  Division.create({:name => name})
  @all_divisions = Division.all()
  erb(:divisions)
end

get('/employees') do
  erb(:employees)
end

get('/division/:id') do
  @current_division = Division.find(params.fetch('id').to_i)
  erb(:division)
end

patch('/division_edit/:id') do
  name_input = params.fetch('name_input')
  @current_division = Division.find(params.fetch('id').to_i)
  @current_division.update({:name => name_input})
  erb(:division)
end

delete('/division_delete/:id') do
  @current_division = Division.find(params.fetch('id').to_i)
  @current_division.delete()
  @all_divisions = Division.all()
  erb(:divisions)
end
