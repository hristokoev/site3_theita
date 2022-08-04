<?php include "globals/seo.tpl"; ?>

<!DOCTYPE html>
<html lang="en">

<head>
	<?php
	if (isset($title)) { echo '<title>' .  $title . '</title>'; }
	else { echo '<title>' .  $templatefields["sitename"] . '</title>'; }
	include "globals/meta.tpl";
	include "tour/globals/include.tpl";
	include "globals/social_headers.tpl";
	include "tour/splashcss.tpl";
	?>
</head>