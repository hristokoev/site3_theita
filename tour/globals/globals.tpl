<?php include "globals/seo.tpl"; ?>
<!DOCTYPE html>
<html lang="<?php echo lang_prefix(0) == "" ? "en" : lang_prefix(0) ; ?>">
<head>
<?php
if (isset($title)) { echo '<title>' .  $title . '</title>'; echo "\n"; }
else { echo '<title>' .  $templatefields["sitename"] . '</title>'; echo "\n"; }
include "globals/meta.tpl"; echo "\n";
include "globals/lang.tpl"; echo "\n";
include "globals/social_headers.tpl"; echo "\n";
include "globals/favicon.tpl"; echo "\n";
include "tour/globals/include.tpl"; echo "\n";
?>
</head>