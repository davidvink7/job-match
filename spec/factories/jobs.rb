# spec/factories/jobs.rb

FactoryBot.define do
    factory(:job) do
        title { Faker::TvShows::RuPaul.queen }
        required_skills { [].concat([Faker::ProgrammingLanguage.unique.name]* 3).join(', ') }
    end
end