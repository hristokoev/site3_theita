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
		$videos = get_from_scheduled_updates(5, 8, 'p');
		$i = 0;
		$layout = [
			"skeleton",
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
			LoadTemplate("components/thumb_video.tpl", ["set" => $set, "prefer" => 'vids', "counter" => $i, "layout" => $layout]);
			$i++;
		}
		?>
	</div>
</section>
<div>
	<a href="<?php echo $areaurl; ?>categories/movies/1/latest/" class="button button-load-more button-outline"><?php echo $templatefields["txtloadmore"]; ?></a>
</div>