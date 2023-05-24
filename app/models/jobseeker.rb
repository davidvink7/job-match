class Jobseeker < ApplicationRecord
    validates :name, presence: true
    validates :skills, presence: true
end
