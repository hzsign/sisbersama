<?php
session_start();
include("../db.php");

error_reporting(0);
if (isset($_GET['action']) && $_GET['action'] != "" && $_GET['action'] == 'delete') {
    $order_id = $_GET['order_id'];

    /* Delete query */
    mysqli_query($con, "DELETE FROM orders WHERE order_id='$order_id'") or die("Delete query is incorrect...");
}

/// Pagination
$page = $_GET['page'];

if ($page == "" || $page == "1") {
    $page1 = 0;
} else {
    $page1 = ($page * 10) - 10;
}

include "sidenav.php";
include "topheader.php";
?>

<!-- End Navbar -->
<div class="content">
    <div class="container-fluid">
        <div class="col-md-14">
            <div class="card ">
                <div class="card-header card-header-primary">
                    <h4 class="card-title">Orders List</h4>
                </div>
                <div class="card-body">
                    <div class="table-responsive ps">
                        <table class="table tablesorter " id="page1">
                            <thead class="text-primary">
                                <tr>
                                    <th>Customer Name</th>
                                    <th>Products</th>
                                    <th>Contact | Email</th>
                                    <th>Details</th>
                                    <th>Shipping</th>
                                    <th>Time</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php 
                                $result = mysqli_query($con, "SELECT order_id, product_title, first_name, mobile, email, address1, address2, product_price, qty FROM orders, products, user_info WHERE orders.product_id = products.product_id AND user_info.user_id = orders.user_id LIMIT $page1, 10") or die("Query 1 incorrect...");

                                while (list($order_id, $p_names, $cus_name, $contact_no, $email, $address1, $address2, $product_price, $quantity) = mysqli_fetch_array($result)) {
                                    echo "<tr>
                                        <td>$cus_name</td>
                                        <td>$p_names</td>
                                        <td>$email<br>$contact_no</td>
                                        <td>$address1, $address2</td>
                                        <td>$quantity</td>
                                        <td>$product_price</td>
                                        <td>
                                            <a class='btn btn-danger' href='orders.php?order_id=$order_id&action=delete'>Delete</a>
                                        </td>
                                    </tr>";
                                }
                                ?>
                            </tbody>
                        </table>
                        <div class="ps__rail-x" style="left: 0px; bottom: 0px;">
                            <div class="ps__thumb-x" tabindex="0" style="left: 0px; width: 0px;"></div>
                        </div>
                        <div class="ps__rail-y" style="top: 0px; right: 0px;">
                            <div class="ps__thumb-y" tabindex="0" style="top: 0px; height: 0px;"></div>
                        </div>
                    </div>
                </div>
            </div>
            <nav aria-label="Page navigation example">
                <ul class="pagination">
                    <li class="page-item">
                        <a class="page-link" href="#" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                            <span class="sr-only">Previous</span>
                        </a>
                    </li>
                    <?php 
                    // Counting pages
                    $paging = mysqli_query($con, "SELECT order_id FROM orders");
                    $count = mysqli_num_rows($paging);

                    $a = $count / 10;
                    $a = ceil($a);

                    for ($b = 1; $b <= $a; $b++) {
                        ?> 
                        <li class="page-item"><a class="page-link" href="orders.php?page=<?php echo $b; ?>"><?php echo $b . " "; ?></a></li>
                        <?php	
                    }
                    ?>
                    <li class="page-item">
                        <a class="page-link" href="#" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                            <span class="sr-only">Next</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</div>
<?php
include "footer.php";
?>
