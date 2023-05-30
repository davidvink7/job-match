# spec/factories/jobseekers.rb

FactoryBot.define do
    factory(:jobseeker) do
        name { Faker::Name.unique.first_name }
        skills { [].concat([Faker::ProgrammingLanguage.unique.name]* 3).join(', ') }
    end
end