import 'bootstrap';
import playersGenerator from './players-generator';
import burgerNavbar from './burgerNavbar';
import bettableDisplay from './bettableDisplay';
import setGradient from './setGradient';
import initializeAjaxForBets from './initializeAjaxForBets';

playersGenerator();
burgerNavbar();
bettableDisplay();
setGradient(document.querySelectorAll('.card-tournament'));
initializeAjaxForBets();
