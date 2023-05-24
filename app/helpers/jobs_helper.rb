module JobsHelper

    def self.match
        sql = Job.connection.execute <<-SQL
        select 
            jobseekers.id as jobseeker_id,
            jobseekers.name as jobseeker_name,
            jobs.id as job_id,
            jobs.title as job_title,
            jobseekers.skills as jobseeker_skills,
            jobs.required_skills as required_skills
        from jobseekers, jobs
        where string_to_array(jobseekers.skills, ',') && string_to_array(jobs.required_skills,( ','));
        SQL

        data = add_match_count(sql.values)
        data = sort_by_id_match_count(data)

        res = {}

        data.each_with_index do |row,idx|
            res[idx] = {
                'jobseeker_id' => row[0],
                'jobseeker_name' => row[1],
                'job_id' => row[2],
                'job_title' => row[3],
                'matching_skill_count' => row[4],
            }
        end

        return res
    end

    def self.add_match_count(data)
        data.map do |row|
            skill_count = (row[-2].split(',') & row[-1].split(',')).count
            row[0..-3] << skill_count
        end
    end

    def self.sort_by_id_match_count(data)
        data.sort_by{ |e| [ e[0], e[-1] ]}
    end

end
