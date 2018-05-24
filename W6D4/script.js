document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });



  // adding SF places as list items

  // --- your code here!
const placeFormEl = document.getElementById('place-form');
placeFormEl.addEventListener('submit', event => {
  event.preventDefault();
  const placeInputEl = document.getElementById('place_form');
  const placeName = placeInputEl.value;
  placeInputEl.value = '';
  const ul = document.getElementById('sf-places');
  const li = document.createElement('li');
  li.textContent = placeName;

  ul.appendChild(li);
});




  // adding new photos

  // --- your code here!
const toggleNewPhotoForm = (e) => document.getElementById('photo-form').classList.toggle('hidden');

document.querySelector('.photo-show-button').addEventListener('click', event => {
  event.preventDefault();
  toggleNewPhotoForm();
  document.getElementById('photo-form').addEventListener('submit', secondEvent => {
    secondEvent.preventDefault();

    const photoInputEl = document.querySelector('.photo-url-input');
    const photoUrl = photoInputEl.value;
    photoInputEl.value = '';

    const ul = document.querySelector('.dog-photos');
    const li = document.createElement('li');
    const img = document.createElement('img');

    img.src = photoUrl;
    li.appendChild(img);
    ul.appendChild(li);
    cornify_add();
  });
});

});
