<?php
if (empty($plugins["ratings"])) return;
if (!isset($type)) {
	echo "type not set";
	return;
}
$hover = (isset($hover)) ? $hover : 0;
$voted = 0;
if ($type == "set" && !empty($voted_sets[$id])) {
	$rating = $voted_sets[$id];
	$voted = 1;
}
if ($type == "model" && !empty($voted_models[$id])) {
	$rating = $voted_models[$id];
	$voted = 1;
}
if ($type == "dvd" && !empty($voted_dvds[$id])) {
	$rating = $voted_dvds[$id];
	$voted = 1;
}
$starclass = ($has_username) ? "rating_voteable" : "rating_nonvoteable";
$new_rating = round($rating / 2, 1);
if ($new_rating > 0.5) {
	echo '<span>Rating:&nbsp;' . $new_rating . '</span><i class="fa fa-star" aria-hidden="true"></i><span>';
}