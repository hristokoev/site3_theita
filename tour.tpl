<?php
$site_url = $_SERVER['REQUEST_URI'];
$parameters = parse_url($site_url);
if ($parameters['query'] !== null) {
	parse_str($parameters['query'], $p);
}
if (isset($p['cat']) && $p['n'] && $p["s"] && $p["p"]) {
	header('Content-type: Application/JSON');
	$sets = get_from_scheduled_updates($p['cat'], $p['n'], $p["s"], $p["p"]);
	$objects = array();
	$cnt = 0;
	foreach ($sets as $set) {
		$objects[$cnt] 				= new stdClass();
		$objects[$cnt]->id 			= $set["Id"];
		$objects[$cnt]->title 		= $set["Title"];
		$objects[$cnt]->seo			= $set["SEOname"];
		$objects[$cnt]->date 		= $set["AppearDate"];
		$objects[$cnt]->rr 			= $set["plg_ratings_rank"];
		$objects[$cnt]->rt			= $set["plg_ratings_total"];
		$cnt++;
	}
	$data = json_encode($objects, JSON_PRETTY_PRINT);
	echo $data;
	exit();
}
$bitrates = array();
?>
<?php
// Get total videos
$link = mysqli_connect("localhost", "vangoren", "j90a930rfe", "vangoren");
$sqlvids = "SELECT `Num` FROM `totals` WHERE `MajorType` = 'setcount' AND `MinorType` = 'vids' AND `siteid` IS NULL LIMIT 1";
$sqlhighres = "SELECT `Num` FROM `totals` WHERE `MajorType` = 'types' AND `MinorType` = 'highres' AND `siteid` IS NULL LIMIT 1";
$sqlmodels = "SELECT `Num` FROM `totals` WHERE `MajorType` = 'models' AND `siteid` IS NULL LIMIT 1";
$resultvids = mysqli_query($link, $sqlvids);
while($row = mysqli_fetch_array($resultvids)) {
    $totalVideos = $row['Num']; 
}
mysqli_free_result($resultvids);
$resulthighres = mysqli_query($link, $sqlhighres);
while($row = mysqli_fetch_array($resulthighres)) {
    $totalPhotos = $row['Num']; 
}
mysqli_free_result($resulthighres);
$resultmodels = mysqli_query($link, $sqlmodels);
while($row = mysqli_fetch_array($resultmodels)) {
    $totalModels = $row['Num']; 
}
mysqli_free_result($resultmodels);
mysqli_close($link);
?>
<?php LoadTemplate("tour/template_sections/header.tpl", ["pagename" => "tour"]); ?>
<div class="main">
	<section class="container">
		<div class="usps-icons">
			<a href="<?php echo $areaurl . lang_prefix() . 'categories/movies/1/latest/'; ?>"><i class="fa-solid fa-clapperboard"></i><span class="count"><?php echo $totalVideos; ?></span><span class="text"><?php echo $templatefields["txtvideos"]; ?></a>
			<a href="<?php echo $areaurl . lang_prefix() . 'categories/photos/1/latest/'; ?>"><i class="fa-solid fa-camera"></i><span class="count"><?php echo $totalPhotos; ?></span><span class="text"><?php echo $templatefields["txtphotos"]; ?></a>
			<a href="<?php echo $areaurl . lang_prefix() . 'models/1/latest/'; ?>"><i class="fa-solid fa-venus-mars"></i><span class="count"><?php echo $totalModels; ?></span><span class="text"><?php echo $templatefields["txtmodels"]; ?></a>
		</div>
		<div class="main-header-title">
			<div class="holder">
				<h1><a href="<?php echo $areaurl . lang_prefix() . 'categories/movies/1/latest/'; ?>"><?php echo $templatefields["txtlatestvideos"]; ?></a></h1>
				<a href="<?php echo $areaurl . lang_prefix() . 'categories/movies/1/latest/'; ?>"><?php echo $templatefields["txtviewall"]; ?>&nbsp;<i class="fa-solid fa-arrow-right-long"></i></a>
			</div>
		</div>
		<div class="grid grid-videos" id="req">
			<?php
			$videos = get_from_scheduled_updates(5, $tour['NumPerPage'], 'DESC');
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
		<a href="<?php echo $areaurl . lang_prefix(); ?>categories/movies/1/latest/" class="button button-load-more button-outline"><?php echo $templatefields["txtloadmore"]; ?></a>
	</div>
	<?php if (array_not_empty($whatshot)) { ?>
	<section class="container">
		<div class="main-header-title">
			<div class="holder">
				<h2><a href="<?php echo $areaurl . lang_prefix(); ?>categories/movies/1/popular/"><?php echo $templatefields["txtfeaturedvideos"]; ?></a></h2>
				<a href="<?php echo $areaurl . lang_prefix(); ?>categories/movies/1/popular/"><?php echo $templatefields["txtviewall"]; ?>&nbsp;<i class="fa-solid fa-arrow-right-long"></i></a>
			</div>
		</div>
		<div class="swiper myCarousel">
			<div class="swiper-wrapper">
				<?php
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
				foreach ($whatshot as $set) {
					$media = $api->getContent(["id" => $set["Id"]]);
					foreach ($media->content['vids'] as $k => $l) {
						foreach ($l as $m => $n) {
							if ($n['name'] == '720p' || $n['name'] == '1080p') $bitrates[] = "HD";
							if ($n['name'] == '4K') $bitrates[] = "4K";
						}
					}
					LoadTemplate("components/thumb_video.tpl", ["set" => $set, "prefer" => 'vids', "class" => "swiper-slide", "counter" => $i, "layout" => $layout, "bitrates" => $bitrates]);
					$i++;
					$bitrates = array();
				}
				?>
			</div>
		</div>
		<div class="swiper-navigation">
			<div id="carousel_button_prev" class="swiper-button-prev"></div>
			<div id="carousel_button_next" class="swiper-button-next"></div>
		</div>
	</section>	
	<div class="button-lined">
		<a href="<?php echo $areaurl . lang_prefix(); ?>categories/movies/1/popular/" class="button button-load-more button-outline"><?php echo $templatefields["txtloadmore"]; ?></a>
	</div>	
	<?php } ?>
	<?php // Middle banner ?>
	<?php // include "tour/template_sections/slider_secondary.tpl"; ?>	
	<section class="container">
		<div class="main-header-title">
			<div class="holder">
				<h2><a href="<?php echo $areaurl . lang_prefix(); ?>models/1/latest/"><?php echo $templatefields["txtourmodels"]; ?></a></h2>
				<a href="<?php echo $areaurl . lang_prefix(); ?>models/1/latest/"><?php echo $templatefields["txtviewall"]; ?>&nbsp;<i class="fa-solid fa-arrow-right-long"></i></a>
			</div>
		</div>
		<div class="grid grid-models-main">
			<?php LoadTemplate("tour/template_sections/our_models.tpl"); ?>
		</div>
	</section>
	<div class="button-lined">
		<a href="<?php echo $areaurl . lang_prefix(); ?>models/1/latest/" class="button button-load-more button-outline"><?php echo $templatefields["txtloadmore"]; ?></a>
	</div>
</div>
<script>
	var carousel = new Swiper(".myCarousel", {
		// autoHeight: true,
		spaceBetween: 16,
		grabCursor: true,
		navigation: {
			nextEl: '#carousel_button_next',
			prevEl: '#carousel_button_prev',
		},
		breakpoints: {
			1200: {
				slidesPerView: 4
			},
			992: {
				slidesPerView: 4
			},
			768: {
				slidesPerView: 2
			},
			576: {
				slidesPerView: 2
			},
			411: {
				slidesPerView: 1
			},
			375: {
				slidesPerView: 1
			},
			360: {
				slidesPerView: 1
			}
		}
	});
</script>
<?php LoadTemplate("tour/template_sections/footer.tpl"); ?>