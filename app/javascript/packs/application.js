import 'bootstrap';
import playersGenerator from './players-generator';
import burgerNavbar from './burgerNavbar';
import bettableDisplay from './bettableDisplay';
import setGradient from './setGradient';

playersGenerator();
burgerNavbar();
bettableDisplay();
setGradient(document.querySelectorAll('.card-tournament'));

document.addEventListener("new_content", (event) => {
  console.log(event.detail)
  setGradient(document.querySelectorAll(event.detail));
})
