<section class="container content">
	<div>
		<h3>Ooops!</h3>
		<h1>ERROR 404</h1>
		<h4>We can't find the page you're looking for.</h4>
		<h3>FUCK ME... RIGHT?</h3>
		<h4 class="page-subtitle">Why don't you check out these videos instead?</h4>
	</div>
	<div class="grid grid-videos">
		<?php
		$bitrates = array();
		$videos = get_from_scheduled_updates(5, 8, 'p');
		$i = 0;
		$layout = [
			"skeleton",
			"bitrate",
			"duration",
			"title",
			"info" => [
				"model",
				"date",
				"stars",
				"title"
			]
		];
		foreach ($videos as $set) {
			$media = $api->getContent(["id" => $set["Id"]]);
			foreach ($media->content['vids'] as $k => $l) {
				foreach ($l as $m => $n) {
					if ($n['name'] == '720p' || $n['name'] == '1080p') $bitrates[] = "HD";
					if ($n['name'] == '4K') $bitrates[] = "4K";
				}
			}
			LoadTemplate("components/thumb_video.tpl", ["set" => $set, "prefer" => 'vids', "counter" => $i, "layout" => $layout, "bitrates" => $bitrates]);
			$i++;
			$bitrates = array();
		}
		?>
	</div>
</section>
<div>
	<a href="<?php echo $areaurl; ?>categories/movies/1/latest/" class="button button-load-more button-outline"><?php echo $templatefields["txtloadmore"]; ?></a>
</div>