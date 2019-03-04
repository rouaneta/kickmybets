const bettableBtn = document.querySelector('#bettable-btn')
const bettableGames = document.querySelectorAll('.unbettable-games')

const bettableDisplay = () => {
  bettableBtn.addEventListener('click', (event) => {
    console.log(bettableGames);
    bettableGames.forEach((bettableGame) => {
      bettableGame.classList.toggle("hidden-bet");
    });
  });
};

export default bettableDisplay;
