
const regexSumsOne = /\d+/;
const regexSumsTwo = /(\d+$)/;

const setGradient = (cardTournaments) => {
  if (cardTournaments) {
    cardTournaments.forEach((cardTournament) => {
      let offsetCard = cardTournament.offsetHeight / 2.747477;
      let margin = 10;
      let totalWidth = cardTournament.offsetWidth + margin * 2;
      let ratioDiv = (totalWidth - offsetCard) / totalWidth * 100;
      cardTournament.style.setProperty('--linear-ratio', ratioDiv + '%')

      let offsetInitial = -totalWidth;
      cardTournament.style.setProperty('--offset-initial', offsetInitial + 'px')

      const oddsSum = cardTournament.querySelector('.odds-sum-info');
      let oddGameOne = 0;
      let oddGameTwo = 0;
      if ((oddsSum != undefined) && (oddsSum.innerText.match(regexSumsOne) != null)) {
        oddGameOne = parseInt(oddsSum.innerText.match(regexSumsOne)[0], 10);
        oddGameTwo = parseInt(oddsSum.innerText.match(regexSumsTwo)[0], 10);
      };

      let gradientOne = 0.5;
      if (oddGameOne + oddGameTwo != 0) {
        gradientOne = oddGameOne / (oddGameOne + oddGameTwo);
      }
      let offsetFinal = -totalWidth + gradientOne * (totalWidth - 100) + 50 + offsetCard / 2 + margin;
      cardTournament.style.setProperty('--offset-final', offsetFinal + 'px')
    })
  }
}

export default setGradient;
