<?php

    //database configuration

    $host       = "localhost";
    $user       = "sheiooec_sajjadjaved";
    $pass       = "QDDhLdL[36BG";
    $database   = "sheiooec_pos";

    $connect = new mysqli($host, $user, $pass, $database);

    if (!$connect) {
        die ("connection failed: " . mysqli_connect_error());
    } else {
        $connect->set_charset('utf8');
    }

?>