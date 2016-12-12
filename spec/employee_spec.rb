require('spec_helper')

describe(Employee) do

  describe('#division') do
    it ('Tells which division it belongs to') do
      test_division = Division.create({:name => 'Money'})
      test_employee = Employee.create({:name => 'Cody', :division_id => test_division.id})
      expect(test_employee.division()).to(eq(test_division))
    end
  end

end
