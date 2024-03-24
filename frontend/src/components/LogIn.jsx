import React, { useState, useEffect } from 'react';

const LogIn = ({ setPage }) => {
  const [formData, setFormData] = useState({ username: "", password: "" });
  const [error, setError] = useState("");

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
      setPage('map');
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

  useEffect(() => {
    document.title = 'Login';
  }, []);

  return (
    <div id="login-container" className="content-container">
      <h1>
        <b>Log In</b>
        <br></br>
        <br></br>
      </h1>
      <form onSubmit={handleSubmit}>
      {!!error ? <div className="alert alert-danger">Error! {error}</div> : <></>}
        <div className="mb-3">
          <input
            type="text"
            className="form-control"
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
            className="form-control"
            id="password"
            name="password"
            value={formData.email}
            onChange={handleChange}
            placeholder="Password"
            required
          />
        </div>
        <br></br>
        <button type="submit" className="btn btn-primary">
          Submit
        </button>
      </form>
    </div>
  );
}

export default LogIn;