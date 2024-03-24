import React, { useState } from "react";
import Login from "./Gamekeep-login.jsx";
import GamekeepPage from "./Gamekeep-page.jsx";

export default function App() {
  const token = localStorage.getItem('token');
  const isAuthenticated = !!token;
  const [page, setPage] = useState(isAuthenticated ? 'page' : 'login');

  const renderPage = () => {
    switch(page) {
      case 'login':
        return <Login setPage={setPage} />;
      case 'page':
        return <GamekeepPage setPage={setPage}/>;
    }
  }

  return (
    <div>
      {renderPage()}
    </div>
  );
}
