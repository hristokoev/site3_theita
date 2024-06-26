<?php
$url="https://mvgcash.com/member_loginlog.php?username=" . $userinfo['UserName'] . "&siteid=19,18,21,20,10,3,23,22,4,2,5,8,7,6,9,14,15,11&ip=" . $_SERVER['REMOTE_ADDR'];
@file($url);
$title = ($subsite) ? $subsite["Name"] : $templatefields["sitename"];
if (isset($_REQUEST['page'])) {
	$current_page = $_REQUEST['page'];
} else {
	$current_page = 1;
}
$fiveCats = ["Anal", "Milf", "Solo", "Teen"];
$colors = array(
	"Anal"			=> "#ff595e",
	"Milf"			=> "#ffca3a",
	"Solo"			=> "#1982c4",
	"Teen"			=> "#6a4c93"
);
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
$bitrates = array();
LoadTemplate("template_sections/header.tpl", ["pagename" => "index", "title" => $title]);
?>
<div class="main">
	<section class="container">
		<div class="main-header-title">
			<div class="holder">
				<h2><a href="<?php echo $areaurl . lang_prefix() . 'categories/categories.html'; ?>"><?php echo $templatefields["txtpopulargenres"]; ?></a></h2>
				<a href="<?php echo $areaurl . lang_prefix() . 'categories/categories.html'; ?>"><?php echo $templatefields["txtviewall"]; ?>&nbsp;<i class="fa-solid fa-arrow-right-long"></i></a>
			</div>
		</div>
		<div class="grid grid-genres">
			<?php
			$cats = $categories['Areas']['cats']['Categories']['cats'];
			foreach ($cats as $cat) {
				if (in_array($cat["Title"], $fiveCats)) {
					$setobj = $api->getSets(["category_filter" => [$cat["Id"]],]);
					if ($setobj->setcount > 0 && $cnt < 4) {
						$thumb_var = $cat['info']['thumbs']; ?>
						<div class="wrap">
							<div class="thumb">
								<div class="thumb-holder half">
									<a href="<?php echo custom_Category_Landing_URL(["id" => $cat["Id"], "seoname" => $cat["SEOname"], "s" => "d", "category" => $cat]) ?>">
										<?php StdCatImage(array("category" => $cat, "usepriority" => "34", "alt" => "", "class" => "thumbs")); ?>
										<div class="overlay-title half">
											<span class="genre"><?php echo $cat["Title"]; ?></span>
										</div>
										<div class="overlay-color" style="background-color: <?php echo genresColor($cat["Title"], $colors); ?>"></div>
									</a>
								</div>
							</div>
						</div><?php
								$cnt++;
							}
						}
					} ?>
		</div>
		<div class="main-header-title">
			<div class="holder">
				<h2><a href="<?php echo $areaurl . lang_prefix() . 'categories/movies/1/latest/'; ?>"><?php echo $templatefields["txtlatestvideos"]; ?></a></h2>
				<a href="<?php echo $areaurl . lang_prefix() . 'categories/movies/1/latest/'; ?>"><?php echo $templatefields["txtviewall"]; ?>&nbsp;<i class="fa-solid fa-arrow-right-long"></i></a>
			</div>
		</div>
		<div class="grid grid-videos">
			<?php
			$videos = get_from_scheduled_updates(5, 12, 'DESC');
			$i = 0;
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
		<div class="button-centered">
			<a href="<?php echo $areaurl . lang_prefix(); ?>categories/movies/1/latest/" class="button button-load-more button-outline"><?php echo $templatefields["txtloadmore"]; ?></a>
		</div>
		<?php if (array_not_empty($comingsoon[0]["sets"]) > 0) { ?>
		<div class="main-header-title">
			<div class="holder">
				<h2><?php echo $templatefields["txtupcoming"]; ?></h2>
				<a href="<?php echo $areaurl . lang_prefix() . 'categories/movies/1/latest/'; ?>"><?php echo $templatefields["txtviewall"]; ?>&nbsp;<i class="fa-solid fa-arrow-right-long"></i></a>
			</div>
		</div>
		<div class="grid grid-videos">
			<?php 
			$i = 0;
			foreach ($comingsoon[0]["sets"] as $set) { ?>
				<?php 
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
			} ?>
		</div>
		<?php } ?>
	</section>
</div>
<?php LoadTemplate("template_sections/footer.tpl"); ?>