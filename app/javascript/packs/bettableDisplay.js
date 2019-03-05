const bettableBtn = document.querySelector('#bettable-btn')
const bettableGames = document.querySelectorAll('.unbettable-games')

const bettableDisplay = () => {
  if (bettableBtn && bettableGames) {
    bettableBtn.addEventListener('click', (event) => {
      bettableGames.forEach((bettableGame) => {
        bettableGame.classList.toggle("hidden-bet");
      });
    });
  };
};

export default bettableDisplay;
