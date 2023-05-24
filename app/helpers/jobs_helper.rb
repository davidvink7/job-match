module JobsHelper

    def self.match
        Job.connection.execute <<-SQL
        CREATE OR REPLACE FUNCTION find_dups(arr anyarray)
        RETURNS anyarray LANGUAGE SQL immutable
        AS $$
            SELECT array_agg(item)
            FROM (
                SELECT item
                FROM unnest(arr) AS item
                GROUP BY item
                HAVING count(*) > 1
            ) s
        $$;
        SELECT
            jobseekers.id AS jobseeker_id,
            jobseekers.name AS jobseeker_name,
            jobs.id AS job_id,
            jobs.title AS job_title,
            jobseekers.skills AS jobseeker_skills,
            jobs.required_skills AS required_skills,
            cardinality(
                find_dups(
                    string_to_array(
                        concat(
                            jobs.required_skills, ',', jobseekers.skills),','))) AS matching_skill_count
        FROM jobseekers, jobs
        WHERE string_to_array(jobseekers.skills, ',') && string_to_array(jobs.required_skills,( ','))
        ORDER BY jobseeker_id, matching_skill_count DESC, job_id;
        SQL
    end

end
