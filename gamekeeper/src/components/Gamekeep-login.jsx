import React, { useState } from "react";
import "./gk-styles.css";

export default function GKLogIn({setPage}) {
  const [formData, setFormData] = useState({ username: "", password: "" });

  const handleSubmit = async (event) => {
    event.preventDefault();
    const response = await fetch("api/login/", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(formData),
    });
    if (response.ok) {
      const responseData = await response.json();
      localStorage.setItem('token', responseData.token);
      setPage('page');
    } else {
      const responseData = await response.json();
      Object.values(responseData).forEach((value) => {
        setError(value[0]);
      } );

    }
  };

  const handleChange = (event) => {
    setFormData({ ...formData, [event.target.name]: event.target.value });
  };

  return (
    <div id="gk-login">
      <h2>
        <br></br>
        Gamekeeper Log In
        <br></br>
        <br></br>
      </h2>
      <form onSubmit={handleSubmit}>
        <div className="mb-3">
          <input
            type="text"
            id="username"
            name="username"
            value={formData.username}
            onChange={handleChange}
            placeholder="Username"
            required
          />
        </div>
        <div className="mb-3">
          <input
            type="password"
            id="password"
            name="password"
            value={formData.email}
            onChange={handleChange}
            placeholder="Password"
            required
          />
        </div>
        <br></br>
        <button type="submit">
          Submit
        </button>
      </form>
    </div>
  );
}