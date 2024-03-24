import React, { useState, useEffect } from 'react';

export default function SignUp({ setPage }) {
  const [formData, setFormData] = useState({
    username: "",
    first_name: "",
    last_name: "",
    email: "",
    password: "",
  });
  const [error, setError] = useState("");

  const handleSubmit = async (event) => {
    event.preventDefault();
    const response = await fetch("api/signup/", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(formData),
    });
    if (response.ok) {
      const responseData = await response.json();
      setPage("login");
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
    document.title = 'Signup';
  }, []);

  return (
    <div id="signup-container" className="content-container">
      <h1>
        <b>Sign Up</b>
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
            placeholder="Username"
            value={formData.username}
            onChange={handleChange}
            required
          />
        </div>
        <div className="mb-3">
          <input
            type="text"
            className="form-control"
            id="first_name"
            name="first_name"
            placeholder="First Name"
            value={formData.first_name}
            onChange={handleChange}
            required
          />
        </div>
        <div className="mb-3">
          <input
            type="text"
            className="form-control"
            id="last_name"
            name="last_name"
            placeholder="Last Name"
            value={formData.last_name}
            onChange={handleChange}
            required
          />
        </div>
        <div className="mb-3">
          <input
            type="email"
            className="form-control"
            id="email"
            name="email"
            placeholder="Email"
            value={formData.email}
            onChange={handleChange}
            required
          />
        </div>
        <div className="mb-3">
          <input
            type="password"
            className="form-control"
            id="password"
            name="password"
            placeholder="Password"
            value={formData.password}
            onChange={handleChange}
            required
          />
        </div>
        <div id="tac">
            <input id="checkbox" type="checkbox" required />
            <label htmlFor="checkbox"> I agree to these <button onClick={() => setPage('termsandconditions')}>Terms and Conditions</button></label>
        </div>
        <button type="submit" className="btn btn-primary">
          Submit
        </button>
      </form>
    </div>
  );
}

