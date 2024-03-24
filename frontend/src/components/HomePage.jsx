import favicon from '../images/favicon.svg';
import "./general-styles.css";
import React, { useEffect } from 'react';

const HomePage = ({ setPage }) => {
  useEffect(() => {
    document.title = 'Home';
  }, []);

  return (
    <div id="home-container" className="content-container">
      <img id="logo" src={favicon} alt="logo" />
      <div>
        <br></br>
        <button onClick={() => setPage('login')} className="btn btn-primary">
          Log In
        </button>
        <button onClick={() => setPage('signup')} className="btn btn-primary">
          Sign Up
        </button>
      </div>
    </div>
  );
}

export default HomePage;
