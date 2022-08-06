<?php
$m = $api->getContent(["id" => $set["Id"]]);
$video = (!empty($media)) ? $media : $m->content;
$imageLowRes = "";
$imageHighRes = "";
$vidarr = array();
foreach ($mediatypes as $mediatype) {
	if ($mediatype["FullVideo"] == 2 && ($mediatype["ShowPlay"] != 2 || in_array($set["Id"], $trial["allowrecent"]))) {
		foreach ($media[$settype] as $tmp1) {
			$arx = $mediatype["Name"] . ":" . $mediatype["Type"];
			if (isset($tmp1[$arx]) && $tmp1[$arx]["show"]) {
				foreach ($media[$settype] as $videogroup) {
					if (isset($videogroup[$mediatype["Name"] . ":" . $mediatype["Type"]])) {
						$nde = $videogroup[$mediatype["Name"] . ":" . $mediatype["Type"]];
						$add = array(
							"id" => $nde["id"],
							"path" => cdn_hook($fpth . $nde["fullpath"]),
							"movie_width" => ($nde["movie_width"] ? $nde["movie_width"] : 320),
							"movie_height" => ($nde["movie_height"] ? $nde["movie_height"] : 240),
							"name" => $mediatype["Name"],
							"type" => $settype,
							"setid" => $set["Id"],
							"label" => $mediatype["Label"],
						);
						if (isset($videogroup["thumb:" . $settype . ":Video Thumbnails"])) {
							$add["thumbnail"] = cdn_hook($fpth . $videogroup["thumb:" . $settype . ":Video Thumbnails"]["fullpath"]);
						} else {
							$add["thumbnail"] = "";
						}
						if (isset($nde["vtt_file"])) {
							$add["vtt_file"] = cdn_hook($fpth . $nde["vtt_file"]);
						} else {
							$add["vtt_file"] = "";
						}
						$vidarr[] = $add;
					}
				}
			}
		}
	}
}
?>
<?php
if (isset($set['info']['thumbs'][14]["1x_filename"])) {
	$imageLowRes = cdn_hook($GLOBALS["contentdir"] . "/contentthumbs/" . $set['info']['thumbs'][14]["1x_filename"]);
	$imageHighRes = cdn_hook($GLOBALS["contentdir"] . "/contentthumbs/" . $set['info']['thumbs'][14]["3x_filename"]);
}
?>
<?php if (!empty($vidarr)) { ?>
<video id="trailer" class="video-js vjs-theme-dt" controls preload="auto" poster="<?php echo $imageHighRes; ?>">
	<?php foreach ($mediatypes as $mediatype) {
		if ($mediatype["FullVideo"] == 2 && ($mediatype["ShowPlay"] != 2 || in_array($set["Id"], $trial["allowrecent"]))) {
			if ($mediatype["Type"] == "vids") {
				foreach ($video["vids"] as $k => $tmp1) {
					if (isset($tmp1[$mediatype["Name"] . ":" . "vids"])) {
						$parr = $tmp1[$mediatype["Name"] . ":" . "vids"];
						if ($mediatype["ShowPlay"] != 2 || $mediatype["ShowDownload"] != 2) {
							echo '<source src="' . cdn_hook($GLOBALS["contentdir"] . "/upload/" . $tmp1[$mediatype["Name"] . ":" . "vids"]["fullpath"]) . '" type="video/mp4" label="' . $mediatype["Name"] . '"/>';
						}
						$vtt = (!empty($parr["vtt_file"])) ? 'https://' . $_SERVER['SERVER_NAME'] . cdn_hook($GLOBALS["contentdir"] . "upload/" . $parr["vtt_file"]) : "";
					}
				}
			}
		}
	} ?>
</video>
<?php } ?>
<div id="promo" style="display: none; width: 100%; aspect-ratio: 16/9; background: cyan">
	<h2>JOIN NOW</h2>
</div>
<script src="https://cdn.jsdelivr.net/npm/video.js@7/dist/video.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/videojs-vtt-thumbnails@0.0.13/dist/videojs-vtt-thumbnails.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@silvermine/videojs-quality-selector@1/dist/js/silvermine-videojs-quality-selector.min.js"></script>
<script>
	let started = 0;
	<?php if (!empty($vidarr)) { ?>
	let vidarr = <?php echo json_encode($vidarr); ?>;
	let player = videojs('trailer', {
		fluid: true,
		controlBar: {
			children: [
				'playToggle',
				'progressControl',
				'volumePanel',
				'currentTimeDisplay',
				'durationDisplay',
				'qualitySelector',
				'fullscreenToggle',
			],
			'pictureInPictureToggle': false
		},
	})
	player.vttThumbnails({
		src: '<?php echo $vtt; ?>'
	});
	player.on('play', function(e) {
		if (started == 0) {
			for (i = 0; i < vidarr.length; i++) {
				if (player.currentSrc().indexOf(escape(vidarr[i].path)) > 0) {
					url = "stattrack.php?pagename=image&id=" + vidarr[i].id + "&cg=" + vidarr[i].setid + "&type=" + vidarr[i].type + "&mt=" + vidarr[i].name;
					$.get(url);
				}
			}
			started = 1;
		}
	});
	player.on('loadstart', function(e) {
		started = 0;
	});
	player.on('ended', function(e) {
		started = 0;
	});
	<?php } ?>
	<?php if (empty($vidarr) && !empty($trial)) { ?>
		$("#promo").ready(function() {
			$("#promo").show();
		});
	<?php } ?>
</script>