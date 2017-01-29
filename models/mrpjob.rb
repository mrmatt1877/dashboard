class Mrpjob < ApplicationRecord
    has_many :runtimes, :dependent => :destroy
    validates :name, presence: true, length: { minimum: 3, maximum: 50 }
    validates :description, presence: true
end
