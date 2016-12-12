class CreateProjects < ActiveRecord::Migration
  def change
    create_table(:projects) do |p|
      p.column(:description, :string)
      p.column(:division_id, :integer)

      p.timestamps()
    end
  end
end
