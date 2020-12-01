const filterBurialType = () => {
  console.log('Hello World')

// 1. select all labels
 const labels = document.querySelectorAll("form > fieldset > div > div > label")
labels.forEach((label) => {
  console.log(label)
// 2. add event listener to each label
 label.addEventListener('click', (event) => {
  console.log('click');

// 3. redirect to same url with parameter = selected label
    function showDetails(params)
    {
      window.location = '/funeral_types/12?burial_type='+params;
    }
// 4. select radio btn with params
 })
});

}

export {filterBurialType}


