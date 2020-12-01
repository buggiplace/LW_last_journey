const filterBurialType = () => {
  console.log('Hello World')

// 1. select all labels [done]
 const labels = document.querySelectorAll("form > fieldset > div > div > label")
labels.forEach((label) => {
  console.log(label)
// 2. add event listener to each label [done]
 label.addEventListener('click', (event) => {
  console.log('click');
// 3. redirect to same url with parameter = selected label [ ]
      window.location.href = window.location.href + "&commit=Filter"
// 4. select radio btn with params => in html
 })
});

}

export {filterBurialType}


