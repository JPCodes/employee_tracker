require('spec_helper')

describe(Employee) do

  describe('#division') do
    it ('Tells which division the employee belongs to') do
      test_division = Division.create({:name => 'Money'})
      test_employee = Employee.create({:name => 'Cody', :division_id => test_division.id})
      expect(test_employee.division()).to(eq(test_division))
    end
  end

  describe('#project') do
    it ('Tells which project the employee belongs to') do
      test_project = Project.create({:description => 'Count money'})
      test_employee = Employee.create({:name => 'Cody', :project_id => test_project.id})
      expect(test_employee.project()).to(eq(test_project))
    end
  end

end
