# spec/models/job_spec.rb

require 'rails_helper'

RSpec.describe Job, :type => :model do
    let!(:job) { build :job }
    let!(:no_title_job) { build :job, title: nil }
    let!(:no_required_skills_job) { build :job, required_skills: nil }

    it "is valid with valid attributes" do
        expect(job).to be_valid
    end

    it "is not valid without a title" do
        expect(no_title_job).to_not be_valid
    end

    it "is not valid without a required skills" do
        expect(no_required_skills_job).to_not be_valid
    end

end