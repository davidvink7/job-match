class Jobseeker < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    validates :skills, presence: true
end
