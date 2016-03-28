<?php
$hostIn     = 'localhost';
$dbIn       = 'wordpress';
$userIn     = 'wordman';
$passwordIn = 'dhfcoddl';
try {
    $MySQLDataBaseLink = new PDO(
                    "mysql:host=" . $hostIn . ";dbname=" . $dbIn, $userIn, $passwordIn);
    $MySQLDataBaseLink->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    echo 'Yippee - good connection' . "\r\n";
} catch(PDOException $e) {
    echo '<h3>Catch Connect Error--->>> ' . $e->getMessage() . '</h3>' . "\r\n";
    return false;
} //End Try Catch
?>
