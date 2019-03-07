import "bootstrap";
import playersGenerator from './players-generator';
import burgerNavbar from './burgerNavbar';
import bettableDisplay from './bettableDisplay';

playersGenerator();
burgerNavbar();
bettableDisplay();

const cardTournaments = document.querySelectorAll('.card-tournament')
const regexSumsOne = /\d+/;
const regexSumsTwo = /(\d+$)/;

const regexOdds = /(\d+\.?\d*)/;

cardTournaments.forEach((cardTournament) => {
  const odds = cardTournament.querySelector('.odds-on-player');
  let oddGame = 2;
  if ((odds != undefined) && (odds.innerText.match(regexOdds) != null)) {
    oddGame = odds.innerText.match(regexOdds)[0];
  };
});


cardTournaments.forEach((cardTournament) => {
  const oddsSum = cardTournament.querySelector('.odds-sum-info');
  let oddGameOne = 0.1;
  let oddGameTwo = 0.1;
  if ((oddsSum != undefined) && (oddsSum.innerText.match(regexSumsOne) != null)) {
    oddGameOne = parseInt(oddsSum.innerText.match(regexSumsOne)[0], 10) + 0.1;
    oddGameTwo = parseInt(oddsSum.innerText.match(regexSumsTwo)[0], 10) + 0.1;
  };
  let gradientOne = oddGameOne * 100 / (oddGameOne + oddGameTwo);
  gradientOne = Math.round(gradientOne * 100) / 100;
  console.log(gradientOne)
  cardTournament.style.setProperty('--gradient', gradientOne + '%')
});
