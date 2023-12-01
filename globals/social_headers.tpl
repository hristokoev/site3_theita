<?php
$image_list = array();
$usepriority = 14;
if ($pagename == "index" && !isset($tourcontent)) {
	// Swap in Twitter Images.
	if (!empty($area["TwitterImages"])) {
		$twa = $area["TwitterImages"];
		shuffle($twa);
		foreach ($twa as $tw) {
			$image_list[] = $areaurl . "content/contentthumbs/" . $tw;
		}
	}
	// Transparent tour / members area index page
	$node = $sets[0]["info"]["thumbs"][$usepriority];
	if (!$node) {
		foreach ($sets as $set) {
			$node = $set["info"]["thumbs"][$usepriority];
			if ($node) {
				$image_list[] = $areaurl . "content/contentthumbs/" . $node["1x_filename"];
			}
		}
	} else {
		$image_list[] = $areaurl . "content/contentthumbs/" . $node["1x_filename"];
	}
} else if (!empty($individual_update) && $GLOBALS["TOUR_ID"]) {
	$node = $set["info"]["thumbs"][$usepriority];
	$image_list[] = $areaurl . "content/contentthumbs/" . $node["1x_filename"];
} else if (($pagename == "index" && $GLOBALS["TOUR_ID"]) || $pagename == "tour") {
	// Swap in Twitter Images.
	if (!empty($area["TwitterImages"])) {
		$twa = $area["TwitterImages"];
		shuffle($twa);
		foreach ($twa as $tw) {
			$image_list[] = $areaurl . "content/contentthumbs/" . $tw;
		}
	}
	// If Twitter images do not exist, use these other images.
	$image_list[0] = $areaurl . "images/social_thumb.jpg";
	// foreach($tourcontent as $item) {
	// 	$image_list[] = $areaurl."content/contentthumbs/".$item["info"]["thumbs"]["14"]["1x_filename"];
	// }
} else if ($pagename == "search") {
	foreach ($sets as $set) {
		$node = $set["info"]["thumbs"][$usepriority];
		if ($node) {
			$image_list[] = $areaurl . "content/contentthumbs/" . $node["1x_filename"];
		}
	}
} else if ($pagename == "trailer") {
	$node = $set["info"]["thumbs"][$usepriority];
	$image_list[] = $areaurl . "content/contentthumbs/" . $node["1x_filename"];
} else if ($pagename == "dvds" && !empty($dvd)) {
	if ($dvd["info"]["thumbs"][$usepriority]) {
		$image_list[] = $areaurl . "content/contentthumbs/" . $dvd["info"]["thumbs"][$usepriority]["1x_filename"];
	}
} else if ($pagename == "dvds") {
	$usepriority = 0;
	foreach ($dvds as $dvd) {
		if ($dvd["info"]["thumbs"][$usepriority]) {
			$image_list[] = $areaurl . "content/contentthumbs/" . $dvd["info"]["thumbs"][$usepriority]["1x_filename"];
		}
	}
} else if ($pagename == "category" && $nav == "models") {
	$usepriority = 16;
	foreach ($models as $model) {
		if ($model["info"]["thumbs"][$usepriority]) {
			$image_list[] = $areaurl . "content/contentthumbs/" . $model["info"]["thumbs"][$usepriority]["1x_filename"];
		}
	}
} else if ($pagename == "sets" && isset($model)) {
	if ($model["info"]["thumbs"][$usepriority]) {
		$image_list[] = $areaurl . "content/contentthumbs/" . $model["info"]["thumbs"][$usepriority]["1x_filename"];
	}
} else if ($pagename == "sets") {
	foreach ($models as $model) {
		if ($model["info"]["thumbs"][$usepriority]) {
			$image_list[] = $areaurl . "content/contentthumbs/" . $model["info"]["thumbs"][$usepriority]["1x_filename"];
		}
	}
} else if ($pagename == "category" && ($category_selected['Title'] == "Tags")) {
	foreach ($tags as $tag) {
		if (isset($tag["info"]["thumbs"])) foreach ($tag["info"]["thumbs"] as $thumb) {
			$image_list[] = $areaurl . "content/contentthumbs/" . $thumb["1x_filename"];
		}
	}
} else if ($pagename == "category") {
	if (!empty($category_selected["info"])) {
		foreach ($category_selected["info"]["thumbs"] as $thumb) {
			$image_list[] = $areaurl . "content/contentthumbs/" . $thumb["1x_filename"];
		}
	}
} else if ($pagename == "gallery") {
	if (!empty($set["info"])) {
		foreach ($set["info"]["thumbs"] as $thumb) {
			$image_list[] = $areaurl . "content/contentthumbs/" . $thumb["1x_filename"];
		}
	}
}
?>
<meta property="og:title" content="<?php echo $title; ?>" />
<?php
if (!empty($image_list) > 0) {
	echo '<meta property="og:image" content="' .  $image_list[0] . '" />' . "\n";
}
if (sizeof($image_list) > 0) {
	$maxcount = 1;
	echo '<meta name="twitter:card" content="summary_large_image">' . "\n";
} else {
	$maxcount = 1;
	echo '<meta name="twitter:card" content="summary">' . "\n";
}
if (!empty($twitter[0])) { ?>
	<meta name="twitter:site" content="@<?php echo $twitter[0]['info']['Username']; ?>">
	<meta name="twitter:creator" content="@<?php echo $twitter[0]['info']['Username']; ?>">
<?php } ?>
<meta name="twitter:title" content="<?php echo $title; ?>" />
<?php if ($seodesc) { ?>
<meta name="twitter:description" content="<?php echo $seodesc ?>" />
<meta property="og:description" content="<?php echo $seodesc ?>" />
<?php } else if ($templatefields["defaultmetadescription"]) { ?>
<meta name="twitter:description" content="<?php echo $templatefields["defaultmetadescription"]; ?>" />
<meta property="og:description" content="<?php echo $templatefields["defaultmetadescription"]; ?>" />
<?php }
$cnt = 0;
foreach ($image_list as $kex => $image) {
	if ($cnt < $maxcount) {
		if ($maxcount > 1) {
			echo '<meta name="twitter:image' . $kex . '" content="' . $image . '" />' . "\n";
		} else {
			echo '<meta name="twitter:image" content="' . $image . '" />' . "\n";
		}
	}
	$cnt++;
}