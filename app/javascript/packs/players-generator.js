const playerNb = document.querySelector('#contest_players_nb');
const playersDiv = document.querySelector('#players-fields');

const playersGenerator = () => {
  if ((typeof playerNb != 'undefined') && (typeof playersDiv != 'undefined')) {
    console.log('OK3');
    const addFields = (event) => {
      playersDiv.innerHTML = '';
      for (let i = 0; i < parseInt(playerNb.value, 10); i++) {
        playersDiv.insertAdjacentHTML('beforeend', '<input type="text" name="contest[players_attributes][][name]">');
      };
    };

    const addFieldsOnChange = playerNb.addEventListener('change', addFields);
  }
}

export default playersGenerator;
