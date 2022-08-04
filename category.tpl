<?php
if ($category_selected['Id'] == $movies_category["Id"]) {
	$current_category = 'vids';
} else if ($category_selected['Id'] == $photos_category["Id"]) {
	$current_category = 'highres';
} else if ($category_selected['Id'] == $tags_category["Id"]) {
	$current_category = 'tags';
} else {
	$current_category = 'category';
}
LoadTemplate("template_sections/header.tpl", ["pagename" => $current_category]);
$prefer = "";
$itemsPerPage = 0;
if ($onpage == $numberofpages && $numberofpages > 1) {
	$itemsPerPage = ($numberofsets - count($sets)) / ($numberofpages - 1);
} else {
	$itemsPerPage = count($sets);
}
?>

<?php
if ($category_selected["Title"] == "Categories") {
	LoadTemplate("pages/genres.tpl");
} else if ($category_selected["Title"] == "Tags") {
	LoadTemplate("pages/tags.tpl");
} else {
?>
	<div class="main">
		<section class="container">
			<div class="page-header">
				<h1 class="page-title"><?php
										if ($category_selected['Id'] == $movies_category["Id"]) {
											echo $templatefields["h1_videos"];
											$prefer = "vids";
										} else if ($category_selected['Id'] == $photos_category["Id"]) {
											echo $templatefields["h1_photos"];
											$prefer = "highres";
										} else if ($category_selected['Parent'] == $categories['Areas']['cats']['Categories']['Id']) {
											echo $category_selected["Title"];
										} else if ($category_selected['Parent'] == $categories['Tags']['Id']) {
											echo $templatefields["h1_tag"] . ' ' . $category_selected["Title"];
										} else {
											echo $templatefields["txtsearchresultsfor"] . " " . $category_selected["Title"];
										} ?>
				</h1>
				<?php if ($category_selected['Id'] == $movies_category["Id"]) { ?>
				<h2 class="page-subtitle"><?php echo $templatefields["h2_videos"]; ?></h2>
				<?php } else if ($category_selected['Id'] == $photos_category["Id"]) { ?>
				<h2 class="page-subtitle"><?php echo $templatefields["h2_photos"]; ?></h2>
				<?php } ?>
				</h2>
				<?php 
				/*		
				<h2 class="page-subtitle"><?php if ($category_selected['Id'] == $movies_category["Id"]) { echo $templatefields["h2_videos"];
											} else if ($category_selected['Id'] == $photos_category["Id"]) { echo $templatefields["h2_photos"];
											} else if ($category_selected['Parent'] == $categories['Areas']['cats']['Categories']['Id']) {
												// TO DO: Get from SEOdec
											} else if ($category_selected['Parent'] == $categories['Tags']['Id']) {
												// TO DO: Get from SEOdesc
											} ?>
				</h2>
				*/ 
				?>
				<?php if ($category_selected['Parent'] == $categories['Areas']['cats']['Categories']['Id'] || $category_selected['Parent'] == $categories['Tags']['Id']) {
					LoadTemplate("components/sort_options.tpl", ["class" => "top"]); 
				} else {
					LoadTemplate("components/sort_options.tpl");
				}
				?>
			</div>
			<div class="grid <?php if ($prefer == 'highres') { ?>grid-photos<?php } else { ?>grid-videos<?php } ?>">
				<?php
				$subsiteid = $_REQUEST['subsiteid'];
				$onpage = (!empty($_REQUEST['page'])) ? $_REQUEST['page'] : 1;
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
				try {
					$videos_items = get_from_scheduled_updates($category_selected['Id'], $itemsPerPage, $_REQUEST['s'], $onpage, '', '', $subsiteid);
					foreach ($videos_items as $set) {
						if ($prefer == 'highres') {
							LoadTemplate("components/thumb_photo.tpl", ["set" => $set, "prefer" => $prefer, "counter" => $i]);
						} else {
							LoadTemplate("components/thumb_video.tpl", ["set" => $set, "prefer" => $prefer, "counter" => $i, "layout" => $layout]);
						}
						$i++;
					}
				} catch (Exception $e) {
					echo '<div class="errorMsg"><h3>Nothing found here.</h3></div>';
				}
				?>
			</div>
			<?php $arr = array('numberofpages' => $numberofpages, 'onpage' => $onpage); ?>
			<div class="pagination pagination-bottom">
				<?php LoadTemplate("components/pagenav.tpl", ["arr" => $arr]); ?>
			</div>
		</section>
	</div>
<?php
}
LoadTemplate("template_sections/footer.tpl");
?>