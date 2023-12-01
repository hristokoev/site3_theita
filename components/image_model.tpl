<?php
$priority = 103;
if (!empty($GLOBALS["tour"])) {
	$cdir = $GLOBALS["contentdir"];
} else {
	$cdir = $GLOBALS["contentdir"];
}
if (isset($priority)) {
	$prefix = "";
	if (strpos($_SERVER['HTTP_ACCEPT'], 'image/webp') !== false) {
		$prefix = "webp_";
	}
	echo "<picture>";
	echo "<img ";
	echo 'id="set-target-' . $model["Id"];
	if ($postfix) echo "_" . $postfix;
	echo '" ';
	if (isset($alt)) echo 'alt="' . $alt . '" ';
	if (isset($style)) echo 'style="' . $style . '" ';
	if (isset($class)) echo 'class="' . $class  . '" ';
	if (isset($loading)) echo 'loading="' . $loading . '" ';
	// echo 'srcset="' . 
	// cdn_hook($cdir . '/contentthumbs/' . $model["info"]["thumbs"][$priority][$prefix . "1x_filename"]) . ' 1x, ' .
	// cdn_hook($cdir . '/contentthumbs/' . $model["info"]["thumbs"][$priority][$prefix . "2x_filename"]) . ' 2x, ' .
	// cdn_hook($cdir . '/contentthumbs/' . $model["info"]["thumbs"][$priority][$prefix . "3x_filename"]) . ' 3x'   .			
	// '" ';
	if ($model["info"]["thumbs"][$priority]["filename"]) echo 'src="' . cdn_hook($cdir . '/contentthumbs/' . $model["info"]["thumbs"][$priority][$prefix . "1x_filename"]) . '" ';
	echo 'v="0" alt="' . $model["ModelName"] . '" />';
} else {
	echo '<img ';
	if (isset($class)) {
		echo 'class="' . $class;
	}
	echo ' src="images/p' . $priority . '.jpg" alt="' . $model["ModelName"] . '" />';
}