<?php
$siteurl = isset($trial) ? 'https://trial.vangoren.com' : 'https://members.vangoren.com';
$thumb_w = "";
$thumb_h = "";
foreach ($photo as $k => $tmp) {
	if (stripos($k, "thumb:") !== FALSE) {
		$thumb = $tmp["file"];
		$thumb_w = $tmp["width"];
		$thumb_h = $tmp["height"];
	}
	if (stripos($k, "jpg:") !== FALSE) {
		$source = $tmp["file"];
		$width = $tmp["width"];
		$height = $tmp["height"];
	}
}
// $md = $media[$settype];
// reset($md);
// $firstphoto = current($md);
// $firstphoto = current($firstphoto)["id"];
// $id = $photo;
// $id = current($photo)["id"];
// /* get the mediatype attribute */
// if (isset($mediatype_attr)) { 
// 	$mt = $mediatype_attr; 
// } else {
// 	// Basically try and get the first matching watermark that exists for this set
// 	$mt = "";
// 	$wname = 0;
// 	foreach ($watermarks as $watermark) {
// 		if (($watermark["Wtype"] == "watermark") && ($wname == 0) && ($watermark["sourceType"] == $settype)) { 
// 			if (isset($set['info']['totals']['watermarks'][$watermark["Name"]]['count'])) { 
// 				$wname = 1;
// 				$mt = $watermark["Name"];
// 			} 
// 		} 
// 	} 
// }
?>

<?php if (current($photo)["show"] == "0") { ?>
	<img <?php if ($thumb_w) { ?>width="<?php echo $thumb_w; ?>" <?php } ?><?php if ($thumb_h) { ?>height="<?php echo $thumb_h ?>" <?php } ?>src="<?php echo cdn_hook($siteurl . $GLOBALS["contentdir"] . "upload/" . $set["Directory"] . $thumb) ?>" />
	<?php echo $templatefields["txtcoming"]; ?><?php echo current($photo)["date"]; ?>
<?php } else { ?>

<a <?php if (isset($trial)) { if (in_array($onpage, $trial["accesspages"]) || $trial["accesspages"][0] == 0 || in_array($set["Id"], $trial["allowrecent"])) { ?> onclick="pswpLightbox.loadAndOpen(<?php echo $n; ?>); return false;" data-id="<?php echo $n; ?>" href="<?php if (in_array($n+1, $trial["clickpages"])) { echo cdn_hook($siteurl . $GLOBALS["contentdir"] . "upload/" . $set["Directory"] . $source); } else { echo GET_Username($trial["photourl"]); } ?>" target="_blank"><?php } else { ?>
	href="<?php echo GET_Username($trial["photourl"]); ?>"><?php } } else { ?>
	onclick="pswpLightbox.loadAndOpen(<?php echo $n; ?>); return false;" data-id="<?php echo $n; ?>" href="<?php echo cdn_hook($siteurl . $GLOBALS["contentdir"] . "upload/" . $set["Directory"] . $source) ?>" target="_blank"><?php } ?>
		<img <?php if ($thumb_w) { ?>width="<?php echo $thumb_w; ?>" <?php } ?><?php if ($thumb_h) { ?>height="<?php echo $thumb_h ?>" <?php } ?>src="<?php echo cdn_hook($siteurl . $GLOBALS["contentdir"] . "upload/" . $set["Directory"] . $thumb) ?>" />
	</a>
<?php } ?>