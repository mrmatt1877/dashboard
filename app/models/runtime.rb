class Runtime < ApplicationRecord
  belongs_to :Mrpjob
  accepts_nested_attributes_for :Mrpjob
end
