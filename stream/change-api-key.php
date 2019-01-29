<?php include('session.php'); ?>
<?php include("public/menubar.php"); ?>

<?php

include('public/fcm.php');

$qry = "SELECT * FROM tbl_fcm_api_key where id = '1'";
$result = mysqli_query($connect, $qry);
$settings_row = mysqli_fetch_assoc($result);

if(isset($_POST['submit'])) {

    $sql_query = "SELECT * FROM tbl_fcm_api_key WHERE id = '1'";
    $img_res = mysqli_query($connect, $sql_query);
    $img_row=  mysqli_fetch_assoc($img_res);

    $data = array(
        'api_key' => $_POST['api_key']
    );

    $news_edit = Update('tbl_fcm_api_key', $data, "WHERE id = '1'");

    if ($news_edit > 0) {
        $_SESSION['msg'] = "9";
        header( "Location:settings.php");
        exit;
    }
}

?>

<!-- START CONTENT -->
<section id="content">

    <!--breadcrumbs start-->
    <div id="breadcrumbs-wrapper" class=" grey lighten-3">
        <div class="container">
            <div class="row">
                <div class="col s12 m12 l12">
                    <h5 class="breadcrumbs-title">Change API Key</h5>
                    <ol class="breadcrumb">
                        <li><a href="dashboard.php">Dashboard</a></li>
                        <li><a href="settings.php">Settings</a></li>
                        <li><a class="active">Change API Key</a></li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
    <!--breadcrumbs end-->

    <!--start container-->
    <div class="container">
        <div class="section">
            <div class="row">
                <form method="post" enctype="multipart/form-data">
                    <div class="col s12 m12 l12">
                        <button type="submit" name="submit" class="btn cyan waves-effect waves-light right" onclick="return confirm('Are you sure want to update API Key?')">Update API Key</button>
                    </div>
                    <div class="col s12 m12 l12">
                        <div class="card-panel">
                            <div class="row">

                                <div class="row">
                                    <div class="input-field col s12">

                                        <?php if(isset($_SESSION['msg'])) { ?>
                                            <div class='card-panel teal lighten-2'>
	                                            <span class='white-text text-darken-2'>
	                                                <?php echo $message[$_SESSION['msg']] ; ?>
	                                            </span>
                                            </div>
                                            <?php unset($_SESSION['msg']); }?>

                                        <div class="input-field col s2">
                                            <a class="btn cyan waves-effect waves-light" href="change-api-key.php?generate=true">Generate</a>
                                        </div>

                                        <?php

                                        function generate_password($chars = 45) {
                                            $characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
                                            return substr(str_shuffle($characters), 0, $chars);
                                        }

                                        $random_api_key = generate_password();

                                        if (isset($_GET['generate'])) {

                                            ?>
                                            <div class="input-field col s10">
                                                <input type="text" name="api_key" id="api_key" value="cda11<?php echo $random_api_key;?>" required />
                                                <label for="api_key">Change API Key</label>
                                            </div>

                                            <?php
                                        }
                                        ?>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>

<?php include('public/footer.php'); ?>
