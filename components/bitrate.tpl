<?php
if ($pagename == "gallery" && $title) {

	$arr = array();

	foreach ($media['vids'] as $k => $l) {
		foreach ($l as $m => $n) {
			if ($n['name'] == '720p' || $n['name'] == '1080p') $arr[] = "HD";
			if ($n['name'] == '4K') $arr[] = "4K";
		}
	}

	$arr = array_unique($arr);
	foreach ($arr as $bitrate) {
		if ($bitrate == "HD") {
			echo '<span class="icon-hd"></span>';
		}
		if ($bitrate == "4K") {
			echo '<span class="icon-4k"></span>';
		}
	}
}

if (isset($icons)) {
	$icons = array_unique($icons);
	foreach ($icons as $bitrate) {
		if ($bitrate == "HD") {
			echo '<span class="icon-hd"></span>';
		}
		if ($bitrate == "4K") {
			echo '<span class="icon-4k"></span>';
		}
	}
}