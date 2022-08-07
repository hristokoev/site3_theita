<?php
$site_url = $_SERVER['REQUEST_URI'];
$parameters = parse_url($site_url);
parse_str($parameters['query'], $p);
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
<?php LoadTemplate("tour/template_sections/header.tpl", ["pagename" => "tour"]); ?>
<script>
	$(document).on("DOMContentLoaded", () => {
		// $("#loadmore").on("click", getData)
	});

	function getData(ev) {
		ev.preventDefault();
		const url = "./templates/thumb_video.html";
		let req = new Request(url, {
			method: "GET"
		});
		for (let i = 1; i <= 8; i++) {
			fetch(req)
				.then(response => response.text())
				.then(text => {
					let main = $("#req");
					let doc = $.parseHTML(text);
					let setId = "";
					let setTitle = "";
					let setSEO = "";
					let setDate = "";
					let rr = "";
					let rt = "";
					let htmlTitle = $(doc).find(".title");
					$.get(`?cat=5&n=1&s=p&p=${i+8}`, function(data) {
						let foundObj = JSON.parse(data);
						setId = foundObj[0]["id"];
						setTitle = foundObj[0]["title"];
						setSEO = foundObj[0]["seo"];
						setDate = foundObj[0]["date"];
						setrr = foundObj[0]["rr"];
						setrt = foundObj[0]["rt"];
						htmlTitle.text(setTitle);
						main.append(doc);
					});
				})
		}
	}
</script>
<div class="main">
	<section class="container">
		<div class="main-header-title">
			<div class="holder">
				<h2><a href="<?php echo $areaurl; ?>categories/movies/1/latest/"><?php echo $templatefields["txtlatestvideos"]; ?></a></h2>
				<a href="<?php echo $areaurl; ?>categories/movies/1/latest/"><?php echo $templatefields["txtviewall"]; ?>&nbsp;<i class="fa-solid fa-arrow-right-long"></i></a>
			</div>
		</div>
		<div class="swiper myCarousel">
			<div class="swiper-wrapper">
				<?php
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
	<section class="container">
		<div class="main-header-title">
			<div class="holder">
				<h2><a href="<?php echo $areaurl . 'categories/movies/1/popular/'; ?>"><?php echo $templatefields["txtmostpopular"]; ?></a></h2>
				<a href="<?php echo $areaurl . 'categories/movies/1/popular/'; ?>"><?php echo $templatefields["txtviewall"]; ?>&nbsp;<i class="fa-solid fa-arrow-right-long"></i></a>
			</div>
		</div>
		<div class="grid grid-videos" id="req">
			<?php
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
	<div class="button-lined">
		<a href="<?php echo $areaurl; ?>categories/movies/1/latest/" id="loadmore" class="button button-load-more button-outline"><?php echo $templatefields["txtloadmore"]; ?></a>
	</div>
	<section class="container">
		<?php include "tour/template_sections/slider_secondary.tpl"; ?>
	</section>
	<section class="container">
		<div class="main-header-title">
			<div class="holder">
				<h2><?php echo $templatefields["txtourmodels"]; ?></h2>
				<a href="<?php echo $areaurl; ?>models/1/latest/"><?php echo $templatefields["txtviewall"]; ?>&nbsp;<i class="fa-solid fa-arrow-right-long"></i></a>
			</div>
		</div>
		<div class="grid grid-models-main">
			<?php LoadTemplate("tour/template_sections/our_models.tpl"); ?>
		</div>
	</section>
	<div class="button-lined">
		<a href="<?php echo $areaurl; ?>models/1/latest/" class="button button-load-more button-outline"><?php echo $templatefields["txtloadmore"]; ?></a>
	</div>
	<div class="content">
		<h1><?php echo $templatefields["h1_site"]; ?></h1>
		<a href="<?php echo $tour['JoinUrl']; ?>" class="button button-join"><?php echo $templatefields["tourtxtjoin"]; ?></a>
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
			hideOnClick: true,
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