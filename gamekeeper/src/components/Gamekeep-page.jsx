import React, { useState } from "react";
import test from "../images/test1.jpg";
import test2 from "../images/test2.jpg";
import test3 from "../images/test3.jpg";

export default function GKPage() {

  const deleteDivById = (divId) => {
    const div = document.getElementById(divId);
    if (div) {
      div.parentNode.removeChild(div);
    }
  };
  
  return (
    <div id="gk-page">

      <button id="gk-logout" onClick={() => setPage('login')}>Log out</button>
      <div id="verify-list">
        
        <div id="verify1" class="verify-task">
          <p class="date">21/03/2024</p>
          <p class="desc">Look for a bin with items in it</p>
          <img class="verify-image" src={test}/>
          <button class="confirm" onClick={() => deleteDivById('verify1')}>Confirm</button>
          <button class="deny" onClick={() => deleteDivById('verify1')}>Deny</button>
        </div>

        <div id="verify2" class="verify-task">
        <p class="date">21/03/2024</p>
          <p class="desc">See empty plate in picture</p>
          <img class="verify-image" src={test2}/>
          <button class="confirm" onClick={() => deleteDivById('verify2')}>Confirm</button>
          <button class="deny" onClick={() => deleteDivById('verify2')}>Deny</button>
        </div>

        <div id="verify3" class="verify-task">
        <p class="date">22/03/2024</p>
          <p class="desc">Look for bike in picture</p>
          <img class="verify-image" src={test3}/>
          <button class="confirm" onClick={() => deleteDivById('verify3')}>Confirm</button>
          <button class="deny" onClick={() => deleteDivById('verify3')}>Deny</button>
        </div>
        
      </div>
    </div>
  );
}
