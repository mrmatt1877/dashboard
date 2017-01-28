class Mrpjob < ApplicationRecord
    has_many :runtimes, :dependent => :destroy
    accepts_nested_attributes_for :runtimes
end
