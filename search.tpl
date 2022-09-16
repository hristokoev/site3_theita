<?php
$title = $templatefields["txtsearch"];
LoadTemplate("template_sections/header.tpl");
$bitrates = array();
?>
<?php if (isset($sets)) { ?>
	<div class="main">
		<section class="container">
			<div class="page-header">
				<h1 class="page-title">
					<?php echo $templatefields["txtsearchresults"]; ?>
				</h1>
				<h2 class="page-subtitle">
					<?php if ($search_query) {
						echo $search_query;
					} else if ($search_all) {
						echo $search_all;
					} else if ($search_any) {
						echo $search_any;
					} else if ($search_phrase) {
						echo $search_phrase;
					} else if (array_not_empty($search_categories)) {
						$clist = [];
						foreach ($search_categories as $cata) {
							if ($all_categories[$cata]) {
								$clist[] = $all_categories[$cata]["Title"];
							}
						}
						echo join(", ", $clist);
					} else if (array_not_empty($search_sites)) {
						$clist = array();
						foreach ($sites as $site) {
							if (in_array($site["Id"], $search_sites)) {
								$clist[] = $site["Name"];
							}
						}
						echo join(", ", $clist);
					} ?>
					<?php if ($search_query && array_not_empty($search_categories)) {
						echo $templatefields["txtin"] . " ";
						$clist = [];
						foreach ($search_categories as $cata) {
							if ($all_categories[$cata]) {
								$clist[] = $all_categories[$cata]["Title"];
							}
						}
						echo join(", ", $clist);
					} ?>
				</h2>
			</div>
			<?php if (!empty($models)) { ?>
				<h3 class="page-subtitle"><?php echo $templatefields["txtvideos"]; ?></h3>
			<?php } ?>
			<?php if (array_not_empty($sets) == 0) { ?>
				<section class="container">
					<div style="display: flex; flex-direction: column; row-gap: 16px; place-items: center; padding: 48px 0;">
						<h3>Oops!</h3>
						<h4><?php echo $templatefields["txtnosearchresults"]; ?></h4>
						<h4 class="page-subtitle">Why don't you check out these videos instead?</h4>
					</div>
					<div class="grid grid-videos">
						<?php
						$bitrates = array();
						$videos = get_from_scheduled_updates(5, 8, 'DESC');
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
				<div class="button-centered">
					<a href="<?php echo $areaurl; ?>categories/movies/1/latest/" class="button button-load-more button-outline"><?php echo $templatefields["txtloadmore"]; ?></a>
				</div>
			<?php } ?>
			<div class="grid grid-videos">
				<?php foreach ($sets as $set) {
					$movie_length = $set["info"]["movie_length"];
					$hType = (isset($set["info"]["totals"]["types"]["highres"])) ? 1 : 0;
					$vType = (isset($set["info"]["totals"]["types"]["vids"])) ? 1 : 0;
					$numP  = (isset($set["info"]["totals"]["types"]["highres"])) ? $set["info"]["totals"]["types"]["highres"]["count"] : 0;
					$usetype = "";
					if ($vType) {
						$usetype = "vids";
					} else if ($hType) {
						$usetype = "highres";
					} else if (array_not_empty($set["info"]["totals"]["types"])) {
						$usetype = each($set["info"]["totals"]["types"]);
						$usetype = $usetype["key"];
					}
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
					$media = $api->getContent(["id" => $set["Id"]]);
					foreach ($media->content['vids'] as $k => $l) {
						foreach ($l as $m => $n) {
							if ($n['name'] == '720p' || $n['name'] == '1080p') $bitrates[] = "HD";
							if ($n['name'] == '4K') $bitrates[] = "4K";
						}
					}
					LoadTemplate("components/thumb_video.tpl", ["set" => $set, "layout" => $layout, "bitrates" => $bitrates]);
					$bitrates = array();
				} ?>
			</div>
			<?php if (!empty($models)) { ?>
				<h3 class="page-subtitle"><?php echo $templatefields["txtmodels"]; ?></h3>
				<div class="grid grid-models">
					<?php foreach ($models as $model) { ?>
						<?php LoadTemplate("components/thumb_model.tpl", ["model" => $model]); ?>
					<?php } ?>
					<?php if (empty($models)) { ?>
						<?php echo $templatefields["txtnolistings"]; ?>
					<?php } ?>
				</div>
			<?php } ?>
			<div class="pagination pagination-bottom">
				<?php LoadTemplate("components/pagenav.tpl"); ?>
			</div>
		<?php } else { ?>
			<section class="container">
				<div style="display: flex; flex-direction: column; row-gap: 16px; place-items: center; padding: 48px 0;">
					<h3>Oops!</h3>
					<h4><?php echo $templatefields["txtnosearchresults"]; ?></h4>
					<h4 class="page-subtitle">Why don't you check out these videos instead?</h4>
				</div>
				<div class="grid grid-videos">
					<?php
					$bitrates = array();
					$videos = get_from_scheduled_updates(5, 8, 'DESC');
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
			<div class="button-centered">
				<a href="<?php echo $areaurl; ?>categories/movies/1/latest/" class="button button-load-more button-outline"><?php echo $templatefields["txtloadmore"]; ?></a>
			</div>
		<?php } ?>
		</section>
	</div>
	<?php LoadTemplate("template_sections/footer.tpl");
