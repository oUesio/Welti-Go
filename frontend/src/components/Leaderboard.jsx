import React, { useEffect } from 'react';

export default function HomePage() {
  useEffect(() => {
    document.title = 'Leaderboard';
  }, []);

  return (
    <div id="leaderboard-container" class="content-container">
      <h1>
        <br></br>
        <br></br>
        <b>Leaderboard</b>
      </h1>
      <div id="leaderboard">
        <table>
          <tr>
            <th>Username</th>
            <th>Tasks Completed</th>
          </tr>
          <tr>
            <td>Alfreds Futterkiste</td>
            <td>Maria Anders</td>
          </tr>
          <tr>
            <td>Centro comercial Moctezuma</td>
            <td>Francisco Chang</td>
          </tr>
          <tr>
            <td>Centro comercial Moctezuma</td>
            <td>Francisco Chang</td>
          </tr>
        </table>
      </div>
    </div>
  );
}