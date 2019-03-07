const initializeTitles = () => {
  const finals = document.querySelector('.game-phase-1');
  const semiFinals = document.querySelector('.game-phase-2');
  const quarterFinals = document.querySelector('.game-phase-3');

  if (finals) {
    finals.insertAdjacentHTML('beforebegin', '<h3 style="grid-column: span 2;">Final</h3>');
  }

  if (semiFinals) {
    semiFinals.insertAdjacentHTML('beforebegin', '<h3 style="grid-column: span 2;">Semi-Finals</h3>');
  }

  if (quarterFinals) {
    quarterFinals.insertAdjacentHTML('beforebegin', '<h3 style="grid-column: span 2;">Quarter-Finals</h3>');
  }
};

export default initializeTitles;
