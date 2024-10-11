<!DOCTYPE html>

<!-- TITLE -->
<title>product_img</title>
<html lang="en" dir="ltr" data-nav-layout="vertical" data-theme-mode="light" data-header-styles="light" data-menu-styles="dark" data-toggled="close">

<?php require ('components/head.php') ?>

<body>

    <!-- PAGE -->
    <div class="page">
        <?php require ('components/topnav.php') ?>

        <?php require ('components/sidenavbar.php') ?>

        <!-- MAIN-CONTENT -->
        <div class="main-content app-content">
            <div class="container-fluid">

                <!-- Page Header -->
                <div class="d-md-flex d-block align-items-center justify-content-between my-4 page-header-breadcrumb">
                    <h1 class="page-title fw-semibold fs-18 mb-0">product_img List</h1>
                    <div class="ms-md-1 ms-0">
                        <nav>
                            <ol class="breadcrumb mb-0">
                                <li class="breadcrumb-item"><a href="#">product_img</a></li>
                            </ol>
                        </nav>
                    </div>
                </div>
                <!-- Page Header Close -->


                <div class="row">
                    <div class="col-xl-12">
                        <div class="card custom-card">
                            <div class="card-header">
                                <a 
                                    id="add_product_img"
                                    class="btn btn-end btn-outline-primary btn-wave d-sm-flex align-items-center justify-content-between"
                                >
                                    Add product img
                                </a>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table id="datatable" class="table table-bordered text-nowrap w-100">
                                        <thead>
                                            <tr>
                                                <th>S.No</th>
                                                <th>Product ID</th>
                                                <th>Product Name</th>
                                                <th>Image</th>
                                                <th>Action</th>

                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <!-- data -->
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>

    <div class="modal fade bs-example-modal-lg" id="popup-modal" tabindex="-1" role="dialog" aria-labelledby="product_imgModelTitle" aria-hidden="true">
        <div class="modal-dialog  modal-lg  modal-dialog-">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="product_imgModelTitle">Add product_img</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="product_img-form">
                        <div class="container">
                            <div class="row">



                            <div class="col-lg-12 mt-3">
                                <div class="form-floating">
                                <select class="form-select" id="productselect" aria-label="Floating label select example" name="product_id">
                                <option value="">Select a Product</option>

                                 
                                </select>
                                <label for="productselect"><span class='text-danger'>*</span>Product Name</label>
                                </div>
                  
                                </div>

                                <div class="col-lg-12 mt-3">
                                    <div>
                                        <label for="product_img" class="form-label"><span class='text-danger'>*</span> Product Image &nbsp;
                                            <span class="text text-success text-small">AllowedFiles : png,jpeg,jpg [1080 x 1440px]</span>
                                        </label>
                                    <div>
                                    <input class="form-control" type="file" id="product_img" name="url">

                                    <img src="" id="product_img_url" alt="image" width="130px" style="padding-top: 15px; display:none;">

                                    <span class="error text-danger product_img mt-5"></span>
                                </div>

                            </div>
                </div>
                
                <div class="mt-3 d-flex justify-content-end align-items-end">
                    <a class="btn btn-success" id="btn-submit">Submit</a>
                </div>

                </hr>
                </form>

            </div>

        </div>
    </div>

    </div>



    <!-- View Details Modal -->
    <div class="modal fade bs-example-modal-lg" id="model-view" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog  modal-lg  modal-dialog-">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="myLargeModalLabel">View product_img Details</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>

                <div class="modal-body">
                    <div class="col-xl-12 ">
                        <div class="table-responsive">
                            <table class="table text-nowrap table-bordered border-success">
                                <thead>
                                    <tr>
                                        <th scope="col">product_img Description</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <td><span style="display: inline-block;" id="description"> </span></td>
                                </tbody>
                            </table>
                        </div>

                    </div>


                    <div class="table-responsive mt-3">
                        <table class="table text-nowrap table-bordered border-success">
                            <thead>
                                <tr>

                                    <th scope="col">Offer Details</th>
                                    <th scope="col">Offer Price</th>
                                    <th>New Arrivals Status</th>
                                    <th scope="col">Soldout Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><span id="offer"> <span></td>
                                    <td><span id="offer-price"> <span></td>
                                    <td><span id="arrival-status"> <span></td>
                                    <td><span id="soldout-status"> <span></td>
                                </tr>

                            </tbody>
                        </table>
                    </div>

                    <div class="table-responsive mt-5">
                        <table class="table text-nowrap table-bordered border-success " id="tbl-img">
                            <thead>
                                <tr>
                                    <th scope="col">Img1</th>
                                    <th scope="col">Img2</th>
                                    <th scope="col">Img3</th>
                                    <th scope="col">Img4</th>
                                </tr>
                            </thead>
                            <tbody>

                                <!--img Code  -->
                            </tbody>
                        </table>
                    </div>

                    <h5 class="modal-title mt-5" id="myLargeModalLabel">Specifications</h5>
                    <div class="table-responsive mt-3">
                        <table class="table text-nowrap table-bordered border-success" id="specific">
                            <thead>
                                <tr>
                                    <th scope="col">Specifications</th>
                                    <th scope="col">Details</th>
                                </tr>
                            </thead>
                            <tbody>

                            </tbody>

                        </table>
                    </div>

                    <h5 class="modal-title mt-5" id="myLargeModalLabel">Features</h5>
                    <div class="table-responsive mt-3">
                        <table class="table text-nowrap table-bordered border-success">
                            <thead>
                                <tr>

                                    <th scope="col">Features</th>

                                </tr>
                            </thead>
                            <tbody>
                                <td>
                                    <p style="text-align:justify;vertical-align: top;" id="product_img-feature"></p>
                                </td>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>


    </div>
    <?php require ('components/footer.php') ?>

    <script src="https://cdn.ckeditor.com/ckeditor5/45.0.0/classic/ckeditor.js"></script>

    <script src="<?= base_url() ?>assets/custom/js/product_image.js"></script>

</body>

</html>