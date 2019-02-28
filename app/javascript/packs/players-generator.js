const playerNb = document.querySelector('#contest_players_nb');
const playersDiv = document.querySelector('#players-fields');

const playersGenerator = () => {
  if (playerNb && playersDiv) {
    console.log(playerNb);
    const addFields = (event) => {
      playersDiv.innerHTML = '';
      for (let i = 0; i < parseInt(playerNb.value, 10); i++) {
        playersDiv.insertAdjacentHTML('beforeend', '<input type="text" name="contest[players_attributes][][name]" required>');
      };
    };

    const addFieldsOnChange = playerNb.addEventListener('change', addFields);
  }
}

export default playersGenerator;
