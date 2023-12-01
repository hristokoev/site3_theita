<?php include "globals/seo.tpl"; ?>
<!DOCTYPE html>
<html lang="en">
<head>
<?php
if (isset($title)) { echo '<title>' .  $title . '</title>'; echo "\n"; }
else { echo '<title>' .  $templatefields["sitename"] . '</title>'; echo "\n"; }
include "globals/meta.tpl"; echo "\n";
include "globals/lang.tpl"; echo "\n";
include "globals/social_headers.tpl"; echo "\n";
include "globals/include.tpl"; echo "\n";
?>
</head>