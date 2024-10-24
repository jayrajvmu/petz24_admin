var mode, masterData = [], product_img_id, productData, product_img;
const module = 'productimage';

$(document).ready(function () {

  refreshDetails();

  //===[ Prevent modal form closing ]===
  $("#popup-modal").modal({
    backdrop: "static",
    keyboard: false,
  });

});

$('#add_product_img').on('click', function () {
  mode = 'new';

  console.log(productData);
  
  cleanPoup();

  
if((typeof productData !== "string")||!productData ){
  $('#productselect').children().remove();
  $('#productselect').append('<option value="">Select a Product</option>');

  
  $.each(productData, function (key, value) {
    $('#productselect')

      .append($('<option>', { value: value.id })
        .text(value.id +" - "+ value.name));

  });
}else{
  SWAL_HANDLER({code:'500', msg:"Please add Product"});

}
 
  $('#product_imgModelTitle').html('Add product_img');
  $("#popup-modal").modal("show");
});


$("#btn-submit").on('click', function () {

  $(".error").hide();

  let formObjectNew = [
    {
      value: $("#productselect").val(),
      error: "Please entrer the Product Name"
    },
    {
      value: $("#product_img").val(),
      error: "Please upload the Product image"
    }
  ]

  let formObjectUpdate = [
    {
      value: $("#productselect").val(),
      error: "Please entrer the Product Name"
    }
  ]

  if (mode == "new") {
    if (FORM_VALIDATION(formObjectNew)) {
      insertproduct_imgData();
    }
  }

  if (mode == "edit") {
    if (FORM_VALIDATION(formObjectUpdate)) {
      updateproduct_imgData();
    }
  }

});

//====[ Edit product_img Data ]===
$(document).on("click", ".btnEdit", function () {

  mode = 'edit';
  let index = $(this).attr("id");

  product_img_id = masterData[index]['product_img_id']
  cleanPoup();


  console.log(masterData);
  

  $('#productselect').children().remove();
  $('#productselect').append($('<option>', { value: masterData[index].product_id }).text(masterData[index].name));
  $.each(productData, function (key, value) {
    $('#productselect')
      .append($('<option>', { value: value.id }).text(value.id +" - "+ value.name));
  });


  $('#product_imgModelTitle').html('Edit product_img');


  if (masterData[index].url) {
    $("#product_img_url").attr('src', masterData[index].url);
    $("#product_img_url").show();
  }

  $("#popup-modal").modal("show");
});

//===[ Insert product_img Data ]===
function insertproduct_imgData() {

  let data = getFormData();
  POST({ module, data }).then((response) => {
    SWAL_HANDLER(response);
    refreshDetails();
  });

}

//===[ Update product_img Data ]===
function updateproduct_imgData() {
  let data = getFormData();
  data.append("product_img_id", product_img_id);
  PUT({ module, data }).then((response) => {
    SWAL_HANDLER(response);

    refreshDetails();
  });
}


function getproductDetails() {
  GET({ module: 'product' }).then((data) => {
    productData = data;    
  });
}

//===[Display image on modal]===
$(document).on("change", "#product_img", function () {
  DISPLAY_IMAGE(this, "product_img_url");
});

//====[ Get All product_img Data ]===
function getproduct_imgDetails() {
  GET({ module }).then((data) => {
    masterData = (data);
    displayproduct_imgDetails(masterData);
  });
}

//===[ Display product_img details]===
function displayproduct_imgDetails(tableData) {


  console.log(tableData);
  

  //===[Destroy Data Table]===
  if ($.fn.DataTable.isDataTable('#datatable')) {
    $('#datatable').DataTable().destroy();
  }

  $('#datatable tbody').empty();


  if (typeof tableData === 'string') {

    $('#datatable').dataTable({
      "oLanguage": {
        "sEmptyTable": "My Custom Message On Empty Table"
      }
    });

  }
  else {

    $("#datatable").DataTable({
      destroy: true,
      aaSorting: [],
      aaData: tableData,
      aoColumns: [
        {
          mDataProp: null,
          render: function (data, type, row, meta) {
            return meta.row + 1;
          },
        },
        {
          mDataProp: "product_id",
        },
        {
          mDataProp: "name",
        },

        
      
        {
          mDataProp: function (data, type, full, meta) {
            if (data.url && data.url !== "") {
              return (`<div class="text-center">
                <img src='${data.url}' alt='not-image' width='100'>
              </div>`);
            } else {
              return "<div class='d-flex align-items-center justify-content-center'>No Image</div>";
            }
          },
        },
        {
          mDataProp: function (data, type, full, meta) {
            return (
              `<a id="${meta.row}" class="btn btnEdit text-info fs-14 lh-1"> <i class="ri-edit-line"></i></a>
            <a id="${meta.row}" class="btn BtnDelete text-danger fs-14 lh-1"> <i class="ri-delete-bin-5-line"></i></a>`
            );
          },
        },
      ],
    });

  }
}

//===[Delete Data]===
$(document).on("click", ".BtnDelete", function () {

  let index = $(this).attr("id");
  mode = "delete";
  product_img_id = masterData[index]['product_img_id'];
  product_img = masterData[index]['url'];

  Swal.fire({
    title: "Alert!",
    text: `You want to delete the ${masterData[index].product_img_name}?`,
    icon: "warning",
    showCancelButton: true,
    confirmButtonColor: "#3085d6",
    cancelButtonColor: "#d33",
    confirmButtonText: "Yes, delete it!",
  }).then((result) => {
    if (result.isConfirmed) {

      DELETE({ module, data: { product_img_id, product_img } }).then((response) => {
        SWAL_HANDLER(response);
        refreshDetails();
      });
    }
  });
});

$(document).on('change', '#navbar_title_id', function () {

  let id = $(this).val();

  $.ajax({
    type: "POST",
    url: base_url + "getsubmenu",
    data: {
      id: id
    },
    dataType: "json",
    success: function (data) {
      $('#navbar_page_id').html('<option value="">Select</option>' + data);
    },
    error: function () {
      console.log("Error");
    },
  });
})

function getFormData() {
  return new FormData($("#product_img-form")[0]);
}

function cleanPoup() {
  $('#product_img-form')[0].reset();
  $('#product_img_url').hide();
}

function refreshDetails() {
  getproduct_imgDetails();
  getproductDetails();
  $("#popup-modal").modal("hide");
}