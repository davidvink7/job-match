Jobseeker.connection.execute <<-SQL
  CREATE TEMP TABLE post_jobseekers (
    id varchar,
    name varchar,
    skills text
  );
SQL

Job.connection.execute <<-SQL
  CREATE TEMP TABLE post_jobs (
    id varchar,
    title varchar,
    required_skills text
  );
SQL

File.open(Rails.root.join('tmp/jobseekers.csv'), 'r') do |file|
    Jobseeker.connection.raw_connection.copy_data %{copy post_jobseekers (id,name,skills) from stdin with csv header delimiter ',' quote '"'} do
    while line = file.gets do
        Jobseeker.connection.raw_connection.put_copy_data line
    end
  end
end

File.open(Rails.root.join('tmp/jobs.csv'), 'r') do |file|
    Job.connection.raw_connection.copy_data %{copy post_jobs (id,title,required_skills) from stdin with csv header delimiter ',' quote '"'} do
    while line = file.gets do
        Job.connection.raw_connection.put_copy_data line
    end
  end
end

Jobseeker.connection.execute <<-SQL
  insert into jobseekers(name, skills)
  select name, skills
  from post_jobseekers
  on conflict(name) do
  update set
    name = EXCLUDED.name,
    skills = EXCLUDED.skills
  returning id
SQL

Job.connection.execute <<-SQL
  insert into jobs(title, required_skills)
  select title, required_skills
  from post_jobs
  on conflict(title) do
  update set
    title = EXCLUDED.title,
    required_skills = EXCLUDED.required_skills
  returning id
SQL