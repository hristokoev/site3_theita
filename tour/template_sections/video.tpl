<?php
$cdn_trailer_url = explode('/trailers/', $trailer_url);
if ($trailer_url == "no_trailer") {
	$fake = 1;
	$trailer_url = "https://cdn.plyr.io/static/blank.mp4";
} else {
	$fake = 0;
	$trailer_url = cdn_hook(str_replace('/content', '', $GLOBALS["contentdir"]) . "/trailers/" . $cdn_trailer_url[1]);
}
if (isset($set['info']['thumbs'][14]["1x_filename"])) {
	$imageLowRes = cdn_hook($GLOBALS["contentdir"] . "/contentthumbs/" . $set['info']['thumbs'][14]["1x_filename"]);
	$imageHighRes = cdn_hook($GLOBALS["contentdir"] . "/contentthumbs/" . $set['info']['thumbs'][14]["3x_filename"]);
}
?>
<video id="trailer" class="video-js vjs-theme-dt" controls preload="auto" poster="<?php echo $imageHighRes; ?>" data-setup="{}">
	<source src="<?php echo $trailer_url; ?>" type="video/mp4" data-fake="<?php echo $fake; ?>" />
</video>
<div class="promo" style="opacity: 0; pointer-events: none;">
	<a href="<?php echo $tour['JoinUrl']; ?>">
		<img src="<?php echo $GLOBALS["areaurl"] . 'images/promo_tour.png'; ?>" alt="">
	</a>
</div>
<script src="https://cdn.jsdelivr.net/npm/video.js@7/dist/video.min.js"></script>
<script>
	var player = videojs('trailer', {
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

	player.on('ended', function() {
		$(".promo").css("opacity", "1");
		$(".promo").css("pointer-events", "auto");
		player.controls(false);
    });

	$(function() {
		var lmt = getCookieTLimit(ctlimit_name);
		var remaining = maxClicks - lmt;
		hasPlayed = false;
		player.on('playing', function() {
			if (remaining > 0) {
				if (hasPlayed == false) tlimit();
				hasPlayed = true;
			} else {
				window.location.href = "<?php echo $tour["JoinUrl"]; ?>";
			}
			if ($("#trailer source").attr("data-fake") == 1) {
				window.location.href = "<?php echo $tour["JoinUrl"]; ?>";
			}
		});	   
	})	
</script>