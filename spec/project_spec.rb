require('spec_helper')

describe(Project) do

  describe('#division') do
    it('returns which division it belongs to') do
      test_division = Division.create({:name => "Money"})
      test_project = Project.create({:description => 'count the money', :division_id => test_division.id})
      expect(test_project.division()).to(eq(test_division))
    end
  end

  describe('.not_done') do
    it('tells you if the project is done or not') do
      not_done_project1 = Project.create({:description => 'count the money', :done => false})
      not_done_project2 = Project.create({:description => 'steal the money', :done => false})
      not_done_projects = [not_done_project1, not_done_project2]
      expect(Project.not_done()).to(eq(not_done_projects))
    end
  end

end
