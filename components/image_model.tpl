<?php
$usep = explode(",", $priority);
$done = 0;
$pexists = 0;
if (!empty($GLOBALS["tour"])) {
	$cdir = $GLOBALS["contentdir"];
} else {
	$cdir = $GLOBALS["contentdir"];
}
if (isset($model["info"]["thumbs"][$usep[0]])) {
	$pexists = 1;
	$pelement = $model["info"]["thumbs"][$usep[0]];
}
if ($pexists) {
	echo "<img ";
	echo 'id="set-target-' . $model["Id"];
	if ($postfix) {
		echo "_" . $postfix;
	}
	echo '" ';
	if ($pelement["width"] > 0) {
		//echo 'width="' . $pelement["width"] . '" ';
	}
	if ($pelement["height"] > 0) {
		//echo 'height="' . $pelement["height"] . '" ';
	}
	if (isset($alt)) {
		echo 'alt="' . $alt . '" ';
	}
	if (isset($style)) {
		echo 'style="' . $style . '" ';
	}
	if (isset($class)) {
		echo 'class="' . $class . ' stdimage thumbs target" ';
	} else {
		echo 'class="stdimage thumbs target" ';
	}
	$cnt = 0;
	foreach ($usep as $k => $up) {
		if (!$model["info"]["thumbs"][$up]) continue;
		// Uncomment this if you want src tags within stdimage for SEO purposes **}
		/*
		if ($cnt == 0)
		{
		   if ($model["info"]["thumbs"][$up]["1x_width"])
		   {
		   	 echo 'src="' . cdn_hook($cdir . '/contentthumbs/' . $model["info"]["thumbs"][$up]["1x_filename"]) . '" ';
		   }
		   else
		   {
		   	 echo 'src="' . cdn_hook($cdir . '/contentthumbs/' . $model["info"]["thumbs"][$up]["filename"]) . '" ';
		   }
		}
		*/
		if ($model["info"]["thumbs"][$up]["1x_width"])
			echo 'src' . $cnt . '_1x="' . cdn_hook($cdir . '/contentthumbs/' . $model["info"]["thumbs"][$up]["1x_filename"]) . '" ';
		if ($model["info"]["thumbs"][$up]["2x_width"])
			echo 'src' . $cnt . '_2x="' . cdn_hook($cdir . '/contentthumbs/' . $model["info"]["thumbs"][$up]["2x_filename"]) . '" ';
		if ($model["info"]["thumbs"][$up]["3x_width"])
			echo 'src' . $cnt . '_3x="' . cdn_hook($cdir . '/contentthumbs/' . $model["info"]["thumbs"][$up]["3x_filename"]) . '" ';
		if (!$model["info"]["thumbs"][$up]["1x_width"] && $model["info"]["thumbs"][$up]["filename"])
			echo 'src' . $cnt . '="' . cdn_hook($cdir . '/contentthumbs/' . $model["info"]["thumbs"][$up]["filename"]) . '" ';
		$cnt++;
	}
	echo 'cnt="' . $cnt . '" v="0" />';
} else {
	echo '<img ';
	if (isset($class)) {
		echo 'class="' . $class . ' stdimage thumbs target" ';
	} else {
		echo 'class="stdimage thumbs target" ';
	}
	echo ' src="images/p' . $usep[0] . '.jpg" />';
}