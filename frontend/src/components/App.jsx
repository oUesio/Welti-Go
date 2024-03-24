import HomePage from "./HomePage";
import SignUp from "./SignUp";
import LogIn from "./LogIn";
import Map from "./Map";
import Collection from "./Collection";
import Account from "./Account";
import TermsAndConditions from "./TermsAndConditions";
import Leaderboard from "./Leaderboard";
import React, { useState } from "react";
import "./navbar-style.css";
import expand from '../images/Expand.svg'
import back from '../images/Back.svg'

export default function App() {
  const token = localStorage.getItem('token');
  const isAuthenticated = !!token;
  const [page, setPage] = useState(isAuthenticated ? 'map' : 'home');
  const [toggleNav, setToggleNav] = useState(true);

  const handleToggleNav = () => {
    setToggleNav(prevToggleNav => !prevToggleNav);
    document.getElementById("navbar").style.width = (toggleNav ? "98%" : "50px")
  }

  const renderPage = () => {
    switch(page) {
      case 'home':
        return <HomePage setPage={setPage} />;
      case 'signup':
        return <SignUp setPage={setPage}/>;
      case 'login':
        return <LogIn setPage={setPage}/>;
      case 'map':
        return <Map setPage={setPage}/>;
      case 'collection':
        return <Collection setPage={setPage}/>;
      case 'account':
        return <Account setPage={setPage}/>;
      case 'leaderboard':
        return <Leaderboard setPage={setPage}/>;
      case 'termsandconditions':
        return <TermsAndConditions setPage={setPage}/>;
    }
  }

  return (
    <div>
      {renderPage()}
      {((page == 'collection') || (page == 'map') || (page == 'account') || (page == 'leaderboard')) && (
        <div id='navbar'>
          {!toggleNav && (
            <div id="nav-buttons">
              <button onClick={() => setPage('map')} >Map</button>
              <button onClick={() => setPage('collection')} >Collection</button>
              <button onClick={() => setPage('leaderboard')} >Leaderboard</button>
              <button onClick={() => setPage('account')}>Account</button>
            </div>
          )}
          <img src={expand} onClick={handleToggleNav}/>
        </div>
      )}
      {((page == 'signup') || (page == 'login') || (page == 'termsandconditions')) && (
        <div className="btn btn-primary back" onClick={() => setPage('home')}>
            <img src={back}/>
            <p>Back</p>
        </div>
      )}
    </div>
  );
}
