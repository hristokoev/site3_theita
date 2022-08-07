<?php
$arr = array();
foreach ($bitrates as $bitrate) {
	$arr[] = $bitrate['Bitrate'];
}

foreach ($mediatypes as $mediatype) {
	if (in_array($mediatype['Bitrate'], $arr) && $mediatype['ShowPlay'] != 0) {
		if ($mediatype['Label'] == "720p") {
			echo '<span class="icon-hd"><span class="path1"></span><span class="path2"></span><span class="path3"></span></span>';
		}
		if ($mediatype['Label'] == "4K") {
			echo '<span class="icon-4k"><span class="path1"></span><span class="path2"></span><span class="path3"></span><span class="path4"></span><span class="path5"></span><span class="path6"></span><span class="path7"></span></span>';
		}
	}
}