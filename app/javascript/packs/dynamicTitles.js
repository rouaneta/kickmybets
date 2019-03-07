const initializeTitles = () => {
  const finals = document.querySelector('.game-phase-1');
  const semiFinals = document.querySelector('.game-phase-2');
  const quarterFinals = document.querySelector('.game-phase-3');

  if (finals) {
    finals.insertAdjacentHTML('beforebegin', '</div><h3>Final</h3><div class="brackets">');
  }

  if (semiFinals) {
    semiFinals.insertAdjacentHTML('beforebegin', '</div><h3>Semi-Finals</h3><div class="brackets">');
  }

  if (quarterFinals) {
    quarterFinals.insertAdjacentHTML('beforebegin', '</div><h3>Quarter-Finals</h3><div class="brackets">');
  }
};

export default initializeTitles;
