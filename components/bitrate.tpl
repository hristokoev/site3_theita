<?php
if ($pagename == "gallery" && $title) {

	$icon = "";

	foreach ($media['vids'] as $video => $formats) {
		foreach ($formats as $format => $parameter) {
			if ($parameter['name'] == '4K') {
				$icon = "4K";
				break 2;
			}	else if ($parameter['name'] == '720p' || $parameter['name'] == '1080p') {
				$icon = "HD";
			}
		}
	}

	if ($icon == "4K") {
		echo '<span class="icon-4k"></span>';
	} else if ($icon == "HD") {
		echo '<span class="icon-hd"></span>';
	}
}

if (isset($icons)) {
	// Check for 4K first
	if (in_array("4K", $icons)) {
			echo '<span class="icon-4k"></span>';
	} elseif (in_array("HD", $icons)) {
			// If 4K is not available, check for HD
			echo '<span class="icon-hd"></span>';
	}
}