import React from "react";
import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
import Home from "../components/home";
import Jobs from "../components/jobs";

export default (
  <Router>
    <Routes>
      <Route path="/" element={<Home />} />
      <Route path="/jobs" element={<Jobs />} />
    </Routes>
  </Router>
);