import React, { useState, useEffect } from "react";
import { Link, useNavigate } from "react-router-dom";

const Jobs = () => {
  const navigate = useNavigate();
  const [jobs, setJob] = useState([]);

  useEffect(() => {
    const url = "/api/v1/jobs/index";
    fetch(url)
      .then((res) => {
        if (res.ok) {
          return res.json();
        }
        throw new Error("Network response was not ok.");
      })
      .then((res) => setJob(res))
      .catch(() => navigate("/"));
  }, []);

  const allJobs = jobs.map((job, index) => (
    <tr key={index}>
      <td>{job.jobseeker_id}</td>
      <td>{job.jobseeker_name}</td>
      <td>{job.job_id}</td>
      <td>{job.job_title}</td>
      <td>{job.matching_skill_count}</td>
    </tr>
  ));

  return (
    <>
      <section className="jumbotron jumbotron-fluid text-center">
        <div className="container py-5">
          <h1 className="display-4">Jobs for everyone!</h1>
          <p className="lead text-muted">
            We’ve pulled together our best matches
          </p>
        </div>
      </section>
      <div className="py-6">
        <main className="container">
          {/* <div className="text-end mb-3">
            <Link to="/job" className="btn custom-button">
              Create New Job
            </Link>
          </div> */}
          <div className="row">
            <table>
              <thead>
                <tr>
                  <th>Jobseeker ID</th>
                  <th>Jobseeker Name</th>
                  <th>Job ID</th>
                  <th>Job Title</th>
                  <th>Matching Skill Count</th>
                </tr>
              </thead>
              <tbody>
                {allJobs}
              </tbody>
            </table>
          </div>
          {/* <Link to="/" className="btn btn-link">
            Home
          </Link> */}
        </main>
      </div>
    </>
  );

};

export default Jobs;