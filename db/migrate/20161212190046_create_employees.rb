class CreateEmployees < ActiveRecord::Migration
  def change
    create_table(:employees) do |e|
      e.column(:name, :string)
      e.column(:division_id, :integer)
      e.column(:project_id, :integer)

      e.timestamps()
    end
  end
end
