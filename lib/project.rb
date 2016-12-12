class Project < ActiveRecord::Base
  has_many(:employees)
  belongs_to(:division)

  scope(:not_done, -> do
    where({:done => false})
  end)
end
