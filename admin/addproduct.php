<?php
session_start();
include("../db.php");
include "sidenav.php";
include "topheader.php";

if(isset($_POST['btn_save'])) {
    $product_cat = $_POST['product_cat'];
    $product_brand = $_POST['product_brand'];
    $product_title = $_POST['product_title'];
    $product_desc = $_POST['product_desc'];
    $product_price = $_POST['product_price'];
    $product_keywords = $_POST['product_keywords'];

    $product_image = $_FILES['product_image']['name'];
    $product_image_temp = $_FILES['product_image']['tmp_name'];

    if(!empty($product_image)) {
        move_uploaded_file($product_image_temp, "../product_images/$product_image");
        $sql = "INSERT INTO products (product_cat, product_brand, product_title, product_price, product_desc, product_image, product_keywords) 
                VALUES ('$product_cat','$product_brand','$product_title','$product_price','$product_desc','$product_image','$product_keywords')";
        if(mysqli_query($con, $sql)) {
            header("location: productlist.php");
        } else {
            echo "Error: " . mysqli_error($con);
        }
    } else {
        echo "Harap unggah gambar produk!";
    }
}

mysqli_close($con);
?>

<div class="content">
        <div class="container-fluid">
          <!-- your content here -->
          <div class="col-md-12">
              <div class="card">
                <div class="card-header card-header-primary">
                  <h4 class="card-title">Tambah Produk</h4>
                  <p class="card-category">Masukkan Data Produk</p>
                </div>
                <div class="card-body">
                  <form action="" method="post" name="form" enctype="multipart/form-data">
                    <div class="row">
                      
                      <div class="col-md-3">
                        <div class="form-group bmd-form-group">
                          <label class="bmd-label-floating">Nama Produk</label>
                          <input type="text" id="product_title" name="product_title" class="form-control" required>
                        </div>
                      </div>
                      <div class="col-md-4">
                        <div class="form-group bmd-form-group">
                          <label class="bmd-label-floating">Tambah Gambar</label>
                          <input type="file" name="product_image" id="product_image"  class="form-control" required>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-md-6">
                        <div class="form-group bmd-form-group">
                          <label class="bmd-label-floating">Deskripsi</label>
                          <input type="text" name="product_desc" id="product_desc" class="form-control" required>
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="form-group bmd-form-group">
                          <label class="bmd-label-floating">Harga</label>
                          <input type="number" id="product_price" name="product_price" class="form-control" required>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-md-12">
                        <div class="form-group bmd-form-group">
                          <label class="bmd-label-floating">Produk Kategori</label>
                          <input type="number" id="product_cat" name="product_cat" class="form-control" required>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-md-4">
                        <div class="form-group bmd-form-group">
                          <label class="bmd-label-floating">Brand Produk</label>
                          <input type="number" name="product_brand" id="product_brand"  class="form-control" required>
                        </div>
                      </div>
                      <div class="col-md-4">
                        <div class="form-group bmd-form-group">
                          <label class="bmd-label-floating">Kata Kunci</label>
                          <input type="text" name="product_keywords" id="product_keywords" class="form-control" required>
                        </div>
                      </div>
                      
                    </div>
                    
                    <button type="submit" name="btn_save" id="btn_save" class="btn btn-primary pull-right">Tambah Produk</button>
                    <div class="clearfix"></div>
                  </form>
                </div>
              </div>
            </div>
        </div>
      </div>
      
<?php
include "footer.php";
?>