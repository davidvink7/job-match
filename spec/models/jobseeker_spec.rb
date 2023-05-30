# spec/models/jobseeker_spec.rb

require 'rails_helper'

RSpec.describe Jobseeker, :type => :model do
    let!(:jobseeker) { build :jobseeker }
    let!(:no_name_jobseeker) { build :jobseeker, name: nil }
    let!(:no_skills_jobseeker) { build :jobseeker, skills: nil }

    it "is valid with valid attributes" do
        expect(jobseeker).to be_valid
    end

    it "is not valid without a name" do
        expect(no_name_jobseeker).to_not be_valid
    end

    it "is not valid without a skills" do
        expect(no_skills_jobseeker).to_not be_valid
    end

end