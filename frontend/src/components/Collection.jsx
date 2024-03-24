import React, { useEffect, useState } from 'react';
import "./collection-style.css";

export default function Collection() {
  const [monsters, setMonsters] = useState([]);

  useEffect(() => {
    document.title = 'Collection';
    getCollection();
  }, []);

  const getCollection = async () => {
    const response = await fetch("api/collection/", {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Token " + localStorage.getItem('token'),
      }
    });
    
    if (response.ok) {
      const responseData = await response.json();
      const monstersArray = responseData.collection.map(item => ({
        name: item.monster.type.name,
        picture: item.monster.type.picture
      }));
      setMonsters(monstersArray);
    } else {
      console.error("Failed to fetch collection");
    }
  };

  const uniqueMonsterNames = Array.from(new Set(monsters.map(monster => monster.name)));

  return (
    <div id="collection-container" className="content-container">
      <h1>
        <br></br>
        <br></br>
        <b>Collection</b>
        <br></br>
      </h1>
      <div id="all">
        <div id="info">
          <p>Percentage of Collection Completed: {Math.round((uniqueMonsterNames.length / 10) * 100)}%</p>
        </div>
        <div className="scrolling-wrapper">
          {monsters.map((monster, index) => (
            <div key={index} className="card-wrap">
              <div className="card-content">
                <h1 className="card-title">{monster.name}</h1>
              </div>
              <div className="card-header">
                <img src={monster.picture} alt={monster.name} />
              </div>
            </div>
          ))}
        </div>
      </div>
    </div>
  );
}
