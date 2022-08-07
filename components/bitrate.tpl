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
			echo '<span class="icon-hd"><span class="path1"></span><span class="path2"></span><span class="path3"></span></span>';
		}
		if ($bitrate == "4K") {
			echo '<span class="icon-4k"><span class="path1"></span><span class="path2"></span><span class="path3"></span><span class="path4"></span><span class="path5"></span><span class="path6"></span><span class="path7"></span></span>';
		}
	}
}

if (isset($icons)) {
	$icons = array_unique($icons);
	foreach ($icons as $bitrate) {
		if ($bitrate == "HD") {
			echo '<span class="icon-hd"><span class="path1"></span><span class="path2"></span><span class="path3"></span></span>';
		}
		if ($bitrate == "4K") {
			echo '<span class="icon-4k"><span class="path1"></span><span class="path2"></span><span class="path3"></span><span class="path4"></span><span class="path5"></span><span class="path6"></span><span class="path7"></span></span>';
		}
	}
}