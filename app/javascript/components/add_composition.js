import applySelect2 from './select2'

const firstRemoveButton = document.querySelector(".remove_record");
const addButton = document.querySelector(".add_record");

function getLastRemoveButton() {
    const removeButtons = document.querySelectorAll(".remove_record");
    return removeButtons[removeButtons.length - 1];
}

const setRemoveButton = (button) => {
    button.addEventListener('click', function(e) {
      e.target.previousElementSibling.value = '1';
      e.target.closest('tr').style.display = 'none';
      return e.preventDefault();
    });
}

if (firstRemoveButton) {
    setRemoveButton(firstRemoveButton);
}

if (addButton) {
  addButton.addEventListener('click',
    function(e) {
      let regexp, time;
      const addComposition = document.querySelector(".add_materials");
      const select2 = document.querySelectorAll(".select2");
      time = new Date().getTime();
      regexp = new RegExp(e.target.getAttribute('data-id'), 'g');
      addComposition.insertAdjacentHTML('beforeend', e.target.getAttribute('data-fields').replace(regexp, time));
      applySelect2();
      setRemoveButton(getLastRemoveButton());
      return event.preventDefault();
    }
  );
}
