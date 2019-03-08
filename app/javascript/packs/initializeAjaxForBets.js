import setGradient from './setGradient';

const initializeAjaxForBets = () => {
  document.addEventListener("new_content", (event) => {
    setGradient(document.querySelectorAll(event.detail));
  })
}

export default initializeAjaxForBets;
