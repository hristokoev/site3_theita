<?php
if ($set["info"]["movie_length"]) {
	if ($set["info"]["movie_length"] < 60) {
		echo '00:' . floor($set["info"]["movie_length"]);
	} else {
		$movie_length = $set["info"]["movie_length"];
		$hours = floor($movie_length / 3600);
		$minutes = ($movie_length / 60) % 60;
		$seconds = $movie_length % 60;
		if ($minutes == 0)  echo '00';
		else if ($minutes > 0 && $minutes < 10) {
			echo '0' . $minutes;
		} else {
			echo $minutes;
		}
		echo ':';
		if ($seconds == 0) {
			echo '00';
		} else if ($seconds > 0 && $seconds < 10) {
			echo '0' . $seconds;
		} else {
			echo $seconds;
		}
	}
}