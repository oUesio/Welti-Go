import React, { useState, useEffect } from 'react';
import "./map-style.css";
import pointerOn from '../images/Pointer_ON.svg'
import pointerOff from '../images/Pointer_OFF.svg'
import map from '../images/Map.svg'
import tick from '../images/Tick.svg'
import cross from '../images/Cross.svg'
import monster from '../images/Monster.svg'
import attach from '../images/Attach.svg'
import attach_valid from '../images/Attach_Valid.svg'

export default function Map() {
  const [currentBuilding, setCurrentBuilding] = useState('');
  const [imageSrc1, setImageSrc1] = useState(attach);
  const [imageSrc2, setImageSrc2] = useState(attach);
  const [imageSrc3, setImageSrc3] = useState(attach);
  const [Task1Desc, setTask1Desc] = useState('');
  const [Task2Desc, setTask2Desc] = useState('');
  const [Task3Desc, setTask3Desc] = useState('');
  const [showOverlay1, setShowOverlay1] = useState(false);
  const [showOverlay2, setShowOverlay2] = useState(false);
  const [showOverlay3, setShowOverlay3] = useState(false);
  const [monster1, setMonster1] = useState('');
  const [monster2, setMonster2] = useState('');
  const [monster3, setMonster3] = useState('');
  const [monster4, setMonster4] = useState('');
  const [monster5, setMonster5] = useState('');
  const [monster6, setMonster6] = useState('');
  const [formData1, setFormData1] = useState({taidsk: "", image: null});
  const [formData2, setFormData2] = useState({id: "", image: null});
  const [formData3, setFormData3] = useState({id: "", image: null});
  const [Task1Id, setTask1Id] = useState(1);
  const [Task2Id, setTask2Id] = useState(1);
  const [Task3Id, setTask3Id] = useState(1);


  const handleSubmit = async (formData, event) => {
    event.preventDefault();
  
    const data = new FormData();
    data.append('task_id', formData.task_id);
    data.append('photo', formData.image);
  
    const response = await fetch("api/task-send/", {
      method: "POST",
      headers: {
        Authorization: "Token " + localStorage.getItem("token"),
      },
      body: data,
    });

  if (response.ok) {
  } else {
    const responseData = await response.json();
    Object.values(responseData).forEach((value) => {
      setError(value[0]);
    });
  }
};

const handleFileChange1 = (event) => {
  const file = event.target.files[0];
  setFormData1({ task_id:Task1Id, image: file });
};

const handleFileChange2 = (event) => {
  const file = event.target.files[0];
  setFormData2({ task_id:Task2Id, image: file });
};

const handleFileChange3 = (event) => {
  const file = event.target.files[0];
  setFormData3({ task_id:Task3Id, image: file });
};

  const handleClick1 = () => {
    setShowOverlay1(true);
    setTimeout(() => {
      setShowOverlay1(false);
    }, 2000);
  };

  const handleClick2 = () => {
    setShowOverlay2(true);
    setTimeout(() => {
      setShowOverlay2(false);
    }, 2000);
  };

  const handleClick3 = () => {
    setShowOverlay3(true);
    setTimeout(() => {
      setShowOverlay3(false);
    }, 2000);
  };

  function calculateDistance(lat1, lon1, lat2, lon2) {
    const R = 6371;
    const dLat = (lat2 - lat1) * (Math.PI / 180);
    const dLon = (lon2 - lon1) * (Math.PI / 180);
    const a =
      Math.sin(dLat / 2) * Math.sin(dLat / 2) +
      Math.cos(lat1 * (Math.PI / 180)) *
        Math.cos(lat2 * (Math.PI / 180)) *
        Math.sin(dLon / 2) *
        Math.sin(dLon / 2);
    const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
    const distance = R * c * 1000;
    return distance;
  }

  const enterBuilding = (pointerid) => {
    const pointer = document.getElementById(pointerid);
    const current = document.getElementById(currentBuilding);
    const buildings = {
      "into-pointer": { name: "INTO", latitude: 50.736325387118086, longitude: -3.535975245769926, id: 1}, //My location to debug, change when finished
      "peter-pointer": { name: "Peter Chalk Centre", latitude: 50.736325387118086, longitude: -3.535975245769926, id: 2 },
      "streath-pointer": { name: "Streatham Court", latitude: 50.73589298893594, longitude: -3.53092028994958, id: 3 },
      "amory-pointer": { name: "Amory Building", latitude: 50.736672146278565, longitude: -3.531684389949515, id: 4 },
      "harrison-pointer": { name: "Harrison Building", latitude: 50.7378497367553, longitude: -3.5326732769422953, id: 5 },
      "forum-pointer": { name: "Forum", latitude: 50.7353738201005, longitude: -3.5337217034418655, id: 6 },
      "swiot-pointer": { name: "SWIoT", latitude: 50.73816689014049, longitude: -3.530605989949407, id: 7 }
    };
    // Turning off pointer can be done anywhere
    if (currentBuilding == pointerid) {
      pointer.src = pointerOff;
      pointer.style.transform = 'scale(1)';
      document.getElementById("inside-words").innerHTML = "Enter a building to view its tasks";
      setCurrentBuilding('');
    } else {
      if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition((position) => {
          const userLat = position.coords.latitude;
          const userLon = position.coords.longitude;
          const building = buildings[pointerid];
          const distance = calculateDistance(userLat, userLon, building.latitude, building.longitude);
          if (currentBuilding) {
            current.src = pointerOff;
            current.style.transform = 'scale(1)';
          }
          if (distance <= 30) {
            setCurrentBuilding(pointerid);
            document.getElementById("inside-words").innerHTML = "Current Building: " + building.name;
            const location_id = building.id;
            
            const getLocation = async () => {
              const response = await fetch(`api/location/${location_id}`, {
                method: "GET",
                headers: {
                  "Content-Type": "application/json",
                  "Authorization": "Token " + localStorage.getItem('token'),
                }
              });
              
              if (response.ok) {
                const respData = await response.json();
                setTask1Desc(respData.location.task_slot1.task_description);
                setTask2Desc(respData.location.task_slot2.task_description);
                setTask3Desc(respData.location.task_slot3.task_description);
                setMonster1(respData.location.task_slot1.monster_slot1.picture);
                setMonster2(respData.location.task_slot1.monster_slot2.picture);
                setMonster3(respData.location.task_slot2.monster_slot1.picture);
                setMonster4(respData.location.task_slot2.monster_slot2.picture);
                setMonster5(respData.location.task_slot3.monster_slot1.picture);
                setMonster6(respData.location.task_slot3.monster_slot2.picture);
                setTask1Id(respData.location.task_slot1.task_id);
                setTask2Id(respData.location.task_slot2.task_id);
                setTask3Id(respData.location.task_slot3.task_id);
              } else {
                console.error("Failed to fetch location data");
              }
            };

            getLocation();

            pointer.src = pointerOn;
            pointer.style.transform = 'scale(1.2)';
          } else {
            document.getElementById("inside-words").innerHTML = `You are ${Math.round(distance)} meters away from ${building.name}. Move closer.`;
            setCurrentBuilding('');
          }
        });
      } else {
        console.error("Geolocation is not supported by this browser.");
      }
    }
  };

  useEffect(() => {
    document.title = 'Map';
  }, []);

  useEffect(() => {
    if (showOverlay1) {
      document.getElementById("monster1-1").src = monster1;
      document.getElementById("monster1-2").src = monster2;
    }
  }, [showOverlay1]);

  useEffect(() => {
    if (showOverlay2) {
      document.getElementById("monster2-1").src = monster3;
      document.getElementById("monster2-2").src = monster4;
    }
  }, [showOverlay2]);

  useEffect(() => {
    if (showOverlay3) {
      document.getElementById("monster3-1").src = monster5;
      document.getElementById("monster3-2").src = monster6;
    }
  }, [showOverlay3]);
  
  return (
    <div id="main">
      <div id="board">
        <img id="map" src={map} />
        <div id="peter" className="location">
          <img
            id="peter-pointer"
            className="pointer"
            src={pointerOff}
            onClick={() => enterBuilding("peter-pointer")}
          />
          <p>Peter Chalk Centre</p>
        </div>
        <div id="into" className="location">
          <img
            id="into-pointer"
            className="pointer"
            src={pointerOff}
            onClick={() => enterBuilding("into-pointer")}
          />
          <p>INTO</p>
        </div>
        <div id="streath" className="location">
          <img
            id="streath-pointer"
            className="pointer"
            src={pointerOff}
            onClick={() => enterBuilding("streath-pointer")}
          />
          <p>Streatham Court</p>
        </div>
        <div id="amory" className="location">
          <img
            id="amory-pointer"
            className="pointer"
            src={pointerOff}
            onClick={() => enterBuilding("amory-pointer")}
          />
          <p>Amory Building</p>
        </div>
        <div id="harrison" className="location">
          <img
            id="harrison-pointer"
            className="pointer"
            src={pointerOff}
            onClick={() => enterBuilding("harrison-pointer")}
          />
          <p>Harrison Building</p>
        </div>
        <div id="forum" className="location">
          <img
            id="forum-pointer"
            className="pointer"
            src={pointerOff}
            onClick={() => enterBuilding("forum-pointer")}
          />
          <p>Forum</p>
        </div>
        <div id="swiot" className="location">
          <img
            id="swiot-pointer"
            className="pointer"
            src={pointerOff}
            onClick={() => {enterBuilding("swiot-pointer");}}
          />
          <p>SWIoT</p>
        </div>
      </div>
      <div id="task-board">
        <br></br>
        <div id="inside">
          <p id="inside-words">Enter a building to view its tasks</p>
        </div>
        {currentBuilding && (
          <div id="all-tasks">
            <div class="task" id="task1">
              {showOverlay1 && (
                <div className="overlay">
                  <img id="monster1-1"/>
                  <img id="monster1-2"/>
                </div>
              )}
              <p>Task 1:{Task1Desc}</p>
              <img src={monster} onClick={handleClick1}/>
              <form class="task-form" onSubmit={(event) => {
                  event.preventDefault();
                  handleSubmit(formData1, event);
                }}>
                <label class="task-label" htmlFor="attach1">
                  <img class="task-button" src={imageSrc1}/>
                </label>
                <input
                  class="task-input"
                  type="file"
                  id="attach1"
                  accept="image/*"
                  onChange={handleFileChange1}
                  required
                />
                <label class="task-label" for="confirm1">
                  <img class="task-button" src={tick}/>
                </label>
                <input 
                  class="task-input"
                  type="submit" 
                  id="confirm1" 
                  />
              </form>
            </div>

            <div class="task" id="task2">
              {showOverlay2 && (
                <div className="overlay">
                  <img id="monster2-1"/>
                  <img id="monster2-2"/>
                </div>
              )}
              <p>Task 2: {Task2Desc}</p>
              <img src={monster} onClick={handleClick2}/>
              <form class="task-form" onSubmit={(event) => {
                  event.preventDefault();
                  handleSubmit(formData2, event);
                }}>
                <label class="task-label" htmlFor="attach2">
                  <img class="task-button" src={imageSrc2}/>
                </label>
                <input
                  class="task-input"
                  type="file"
                  id="attach2"
                  accept="image/*"
                  onChange={handleFileChange2}
                  required
                />
                <label class="task-label" for="confirm2">
                  <img class="task-button" src={tick}/>
                </label>
                <input 
                  class="task-input"
                  type="submit" 
                  id="confirm2" 
                  />
              </form>
            </div>

            <div class="task" id="task3">
              {showOverlay3 && (
                <div className="overlay">
                  <img id="monster3-1"/>
                  <img id="monster3-2"/>
                </div>
              )}
              <p>Task 3: {Task3Desc}</p>
              <img src={monster} onClick={handleClick3}/>
              <form class="task-form" onSubmit={(event) => {
                  event.preventDefault();
                  handleSubmit(formData3, event);
                }}>
                <label class="task-label" htmlFor="attach3">
                  <img class="task-button" src={imageSrc3}/>
                </label>
                <input
                  class="task-input"
                  type="file"
                  id="attach3"
                  accept="image/*"
                  onChange={handleFileChange3}
                  required
                />
                <label for="confirm3">
                  <img class="task-button" src={tick}/>
                </label>
                <input 
                  class="task-input"
                  type="submit" 
                  id="confirm3" 
                  />
              </form>
            </div>
          </div>
        )}
      </div>
    </div>
  );
}
