function FORM_VALIDATION(formData){  
    
    if(formData.length == 0){
        return false;
    }

    for (let item of formData) {
      // Check if the field is empty
      if (item.value === "" || item.value === null || item.value === undefined) {
          validateError(item.error);
          return false;
      }

      // Additional check for product price (if numberCheck is true)
      if (item.numberCheck && (isNaN(item.value) || item.value <= 0)) {
          validateError("Please enter a valid number for product price.");
          return false;
      }
  }

    return true;
}

function DISPLAY_IMAGE(input, element_id) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function (e) {
        $("#" + element_id).attr("src", e.target.result).show();
      };
      reader.readAsDataURL(input.files[0]);
    }
}

function validateError(message) {
    $.toast({
      icon: "error",
      heading: "Warning",
      text: message,
      position: "top-right",
      bgColor: "#red",
      loader: true,
      hideAfter: 2000,
      stack: false,
      showHideTransition: "fade",
    });
}

function SWAL_HANDLER({code, msg}){

  let _swal = {
    '200': {
      icon: 'success',
      title: 'Congratulations!'
    },
    '400': {
      icon: 'warning',
      title: 'Warning!'
    },
    '500': {
      icon: 'error',
      title: 'Error!'
    }
  }

  Swal.fire({
    title: _swal[code].title || 'Error!',
    text: msg || 'something went wrong!',
    icon: _swal[code].icon || 'error',
  });
}

function CAPITALIZE(string){
  return string[0].toUpperCase() + string.slice(1)
}