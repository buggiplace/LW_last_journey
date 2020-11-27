// const Choices = require('choices.js')
import Choices from 'choices.js';
const initChoices = () => {
  const element = document.querySelector('.js-choice');
  const choices = new Choices(element,
    {  addItems: true,
      addItemText: (value) => {
      return `Press Enter to add <b>"${value}"</b>`;
    }
  });
};
export { initChoices };
