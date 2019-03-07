const cardTournaments = document.querySelectorAll('.card-tournament')
const regexSumsOne = /\d+/;
const regexSumsTwo = /(\d+$)/;

const setGradient = () => {
  if (cardTournaments) {
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
      cardTournament.style.setProperty('--gradient', gradientOne + '%')
    });
  }
}

export default setGradient;
