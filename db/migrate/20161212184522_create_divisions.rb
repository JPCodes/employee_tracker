class CreateDivisions < ActiveRecord::Migration
  def change
    create_table(:divisions) do |d|
      d.column(:name, :string)

      d.timestamps()
    end
  end
end
