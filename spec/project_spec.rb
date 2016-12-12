require('spec_helper')

describe(Project) do

  describe('#division') do
    it('returns which division it belongs to') do
      test_division = Division.create({:name => "Money"})
      test_project = Project.create({:description => 'count the money', :division_id => test_division.id})
      expect(test_project.division()).to(eq(test_division))
    end
  end


end
