﻿<?php
require("init.php");
$zapytanie = "SELECT `id`, `name` FROM `forum_threads`";
$idzapytania = mysql_query($zapytanie);
if($idzapytania == false) {
echo "-1";
die;
}
$suc = false;
while ($wiersz = mysql_fetch_row($idzapytania)){
if($_GET['threadid'] == $wiersz[0]) {
$suc = true;
$name = $wiersz[1];
}
}
if($suc == false)
echo "-3\r\n".$_GET['threadid'];
else
echo "0\r\n" . $name;
?>