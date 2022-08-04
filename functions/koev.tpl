<?php
function genresColor($inputGenre, $colors) {	
	foreach ($colors as $genre => $color) {
		if ($genre == $inputGenre) {
			return $color;
		}
	}	
}
function randomColor($input, $mode = null) {
    if ($mode == "light") {
        $minVal = 127;
        $maxVal = 255;
    } else if ($mode == "dark") {
        $minVal = 0;
        $maxVal = 127;
    }
        
    if (is_null($mode)) {
        $minVal = 0;
        $maxVal = 255;        
    }
    $minVal = $minVal < 0 || $minVal > 255 ? 0 : $minVal;
    $maxVal = $maxVal < 0 || $maxVal > 255 ? 255 : $maxVal;
	preg_match("/([0-9]+)/", md5($input), $matches);
	srand($matches[0]);
    $r = mt_rand($minVal, $maxVal);
    $g = mt_rand($minVal, $maxVal);
    $b = mt_rand($minVal, $maxVal);
    return sprintf('#%02X%02X%02X', $r, $g, $b);
}
function randomIcon($input) {
	$iconsArr = [
		'<i class="fa-solid fa-face-smile fa-2x"></i>',
		'<i class="fa-solid fa-face-grin fa-2x"></i>',
		'<i class="fa-solid fa-face-grin-beam fa-2x"></i>',
		'<i class="fa-solid fa-face-smile-wink fa-2x"></i>',
		'<i class="fa-solid fa-face-kiss-beam fa-2x"></i>',
		'<i class="fa-solid fa-face-laugh-squint fa-2x"></i>'
	];    
	preg_match("/([0-9]+)/", md5($input), $matches);
	srand($matches[0]);
	$index = mt_rand(0, 5);
	return $iconsArr[$index];
}
function Mailbox_URL($arr=array()) {
	
	$ret = "mailbox.php";
	if ($arr["inbox"] > 0) {
		$arrpush[] = "inbox=$arr[inbox]";
	} else {
		$arrpush[] = "inbox=0";
	}
	if ($arr["page"] > 1)	$arrpush[] = "page=$arr[page]";
	if (!empty($arrpush)) {
		$ret .= "?" . join("&", $arrpush);
	}
	return $ret;
}