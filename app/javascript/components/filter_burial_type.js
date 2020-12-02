const filterBurialType = () => {
  console.log('Hello World')

// 1. select all labels [done]
 const labels = document.querySelectorAll("form > fieldset > div > div > label")
labels.forEach((label) => {
  // console.log(label)
// 2. add event listener to each label [done]
 label.addEventListener('click', (event) => {
  console.log(label);
  var getUrl = window.location;
  var baseUrl = getUrl .protocol + "//" + getUrl.host + getUrl.pathname;
// 3. redirect to same url with parameter = selected label [ ]
      window.location.href = baseUrl + "?burial_type="+ label.innerText + "#anchor_burial_type"
 })
});

}

export {filterBurialType}


// http://localhost:3000/funeral_types/12?burial_type=Burial+at+sea&commit=Filter
