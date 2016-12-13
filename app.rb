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

# Start Divisions Routing
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

get('/division/:id') do
  @current_division = Division.find(params.fetch('id').to_i)
  @division_employees = Employee.where(division_id: @current_division.id)
  erb(:division)
end

patch('/division_edit/:id') do
  name_input = params.fetch('name_input')
  @current_division = Division.find(params.fetch('id').to_i)
  @current_division.update({:name => name_input})
  erb(:division)
end

get('/division_employee/:id') do
  @current_division = Division.find(params.fetch('id').to_i)
  @all_employees = Employee.all()
  erb(:division_employee)
end

patch('/employee_assignment/:id') do
  @new_employee = Employee.find(params.fetch('employee').to_i)
  @current_division = Division.find(params.fetch('id').to_i)
  @new_employee.update({:division_id => @current_division.id})
  @division_employees = Employee.where(division_id: @current_division.id)
  erb(:division)
end

delete('/division_delete/:id') do
  @current_division = Division.find(params.fetch('id').to_i)
  @current_division.delete()
  @all_divisions = Division.all()
  erb(:divisions)
end
# End Divisions Routing

# Start Employees Routing
get('/employees') do
  @all_employees = Employee.all()
  erb(:employees)
end

post('/employees_form') do
  name = params.fetch('name_input')
  Employee.create({:name => name})
  @all_employees = Employee.all()
  erb(:employees)
end

get('/employee/:id') do
  @current_employee = Employee.find(params.fetch('id').to_i)
  if !@current_employee.division.nil?
    @current_division = Division.find(@current_employee.division)
  end
  erb(:employee)
end

patch('/employee_edit/:id') do
  name_input = params.fetch('name_input')
  @current_employee = Employee.find(params.fetch('id').to_i)
  @current_employee.update({:name => name_input})
  @current_division = Division.find(@current_employee.division)
  erb(:employee)
end

delete('/employee_delete/:id') do
  @current_employee = Employee.find(params.fetch('id').to_i)
  @current_employee.delete()
  @all_employees = Employee.all()
  erb(:employees)
end

get('/employee_division/:id') do
  @current_employee = Employee.find(params.fetch('id').to_i)
  @all_divisions = Division.all()
  erb(:employee_division)
end

patch('/division_assignment/:id') do
  @new_division = params.fetch('new_division').to_i
  @current_employee = Employee.find(params.fetch('id').to_i)
  @current_employee.update({:division_id => @new_division})
  @current_division = Division.find(@new_division)
  erb(:employee)
end
# End Employees Routing

# Start Projects Routing
get('/project_manager') do
  erb(:project_manager)
end

get('/projects') do
  @all_projects = Project.all()
  erb(:projects)
end

post('/projects_form') do
  description = params.fetch('description_input')
  Project.create({:description => description})
  @all_projects = Project.all()
  erb(:projects)
end

get('/project/:id') do
  @current_project = Project.find(params.fetch('id').to_i)
  if !@current_project.division.nil?
    @current_division = Division.find(@current_project.division)
  end
  erb(:project)
end

patch('/project_edit/:id') do
  description_input = params.fetch('description_input')
  @current_project = Project.find(params.fetch('id').to_i)
  @current_project.update({:description => description_input})
  if !@current_project.division.nil?
    @current_division = Division.find(@current_project.division)
  end
  erb(:project)
end

delete('/project_delete/:id') do
  @current_project = Project.find(params.fetch('id').to_i)
  @current_project.delete()
  @all_projects = Project.all()
  erb(:projects)
end

get('/project_division/:id') do
  @current_project = Project.find(params.fetch('id').to_i)
  @all_divisions = Division.all()
  erb(:project_division)
end

patch('/division_assignment_project/:id') do
  @new_division = params.fetch('new_division').to_i
  @current_project = Project.find(params.fetch('id').to_i)
  @current_project.update({:division_id => @new_division})
  @current_division = Division.find(@new_division)
  erb(:project)
end

# End Projects Routing
