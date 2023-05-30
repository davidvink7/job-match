class Job < ApplicationRecord
    validates :title, presence: true, uniqueness: true
    validates :required_skills, presence: true
end
