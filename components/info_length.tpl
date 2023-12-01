<?php
if ($set["info"]["totals"]["types"]["highres"]) {
	echo $set["info"]["totals"]["types"]["highres"]["count"] . "&nbsp;" . $templatefields["txtphotos"];
}
if ($set["info"]["movie_length"] && $set["info"]["totals"]["types"]["highres"]) {
	echo ", ";
}
if ($set["info"]["movie_length"]) {
	if ($set["info"]["movie_length"] < 60) {
		echo floor($set["info"]["movie_length"]) . "&nbsp;" . $templatefields["txtseconds"];
	} else {
		echo floor($set["info"]["movie_length"] / 60) . "&nbsp;" . $templatefields["txtminutes"];
	}
	echo "&nbsp;" . $templatefields["txtofvideo"];
}