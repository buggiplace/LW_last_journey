import $ from 'jquery';
import 'select2';
const initSelect2 = () => {
  $('.select2').select2({multiple: true,
    createTag: function (params) {
    var term = $.trim(params.term);

    if (term === '') {
      return null;
    }

    return {
      id: term,
      text: term,
      newTag: true // add additional parameters
    }
  },
  insertTag: function (data, tag) {     // Insert the tag at the end of the results 
    data.push(tag); 
  } 
  });
};
export { initSelect2};




// $('select').select2({
//   createTag: function (params) {
//     var term = $.trim(params.term);

//     if (term === '') {
//       return null;
//     }

//     return {
//       id: term,
//       text: term,
//       newTag: true // add additional parameters
//     }
//   }
// });
