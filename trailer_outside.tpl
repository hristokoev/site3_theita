<?php
$today = date("Y-m-d H:i:s");
LoadTemplate("tour/template_sections/header.tpl", ["pagename" => "trailer"]); 
$bitrates = array(); 
?>
<div class="main">
	<section class="container">
		<div class="trailer">
			<div class="trailer-wrapper">
				<div class="trailer-video">
					<?php
					$my_trailer_url = custom_get_trailer_url($tour['Id'], $set['Id']);
					LoadTemplate("tour/template_sections/video.tpl", ["pagename" => "trailers", "trailer_url" => $my_trailer_url]);
					?>
				</div>
				<div class="trailer-join">
					<h2><?php echo $templatefields["tourtxttrailer"]; ?></h2>
					<ul>
						<li><i class="fa fa-play-circle" aria-hidden="true"></i>&nbsp;<?php echo $templatefields["tourtxttrailer1"]; ?></li>
						<li><i class="fa fa-download" aria-hidden="true"></i>&nbsp;<?php echo $templatefields["tourtxttrailer2"]; ?></li>
						<li><i class="fa fa-check" aria-hidden="true"></i>&nbsp;<?php echo $templatefields["tourtxttrailer3"]; ?></li>
						<li><i class="fa fa-lock" aria-hidden="true"></i>&nbsp;<?php echo $templatefields["tourtxttrailer4"]; ?></li>
					</ul>
					<a href="<?php echo $tour["JoinUrl"] . lang_join_suffix(); ?>" class="button button-join" style="display: block;"><?php echo $templatefields["tourtxtjoin"]; ?></a>
				</div>
			</div>
			<div class="trailer-details">
				<div class="info">
					<span class="date">
						<?php 
							$day = date("j", strtotime($set['AppearDate'])); 
							$month = date("m", strtotime($set['AppearDate'])); 
							$year = date("Y", strtotime($set['AppearDate'])); 
							if ($month==1) {
								$month = $templatefields["txtjanuary"];
							} else if ($month==2) {
								$month = $templatefields["txtfebruary"];
							} else if ($month==3) {
								$month = $templatefields["txtmarch"];
							} else if ($month==4) {
								$month = $templatefields["txtapril"];
							} else if ($month==5) {
								$month = $templatefields["txtmay"];
							} else if ($month==6) {
								$month = $templatefields["txtjune"];
							} else if ($month==7) {
								$month = $templatefields["txtjuly"];
							} else if ($month==8) {
								$month = $templatefields["txtaugust"];
							} else if ($month==9) {
								$month = $templatefields["txtseptember"];
							} else if ($month==10) {
								$month = $templatefields["txtoctober"];
							} else if ($month==11) {
								$month = $templatefields["txtnovember"];
							} else if ($month==12) {
								$month = $templatefields["txtdecember"];
							}
							echo "$day-$month-$year";
						?>
					</span>
					<span class="length"><?php LoadTemplate("components/info_length_short.tpl", ["set" => $set]); ?></span>
				</div>
				<div class="title">
					<h1><?php echo $set["Title"]; ?></h1>
				</div>
				<div class="starring">
					<span><?php echo $templatefields["txtstarring"]; ?>: </span>
					<span><?php LoadTemplate("components/list_models.tpl", ["set" => $set, "modellimit" => "999", "today" => $today]); ?></span>
				</div>
				<div class="rating">
					<span><?php LoadTemplate("components/info_rating.tpl", ["id" => $set["Id"], "type" => "set", "rating" => $set["plg_ratings_rank"] / (($set["plg_ratings_total"]) ? $set["plg_ratings_total"] : 1) * 10]); ?></span>
				</div>
				<div class="description">
					<p><?php echo $set["Description"]; ?></p>
				</div>
			</div>
			<div class="trailer-buttons">
				<a href="<?php echo $tour["JoinUrl"] . lang_join_suffix(); ?>" class="active"><i class="fa-regular fa-circle-play fa-2x" aria-hidden="true"></i><span><?php echo $templatefields["txtmovies"]; ?></span></a>
				<a href="<?php echo $tour["JoinUrl"] . lang_join_suffix(); ?>"><i class="fa-solid fa-images fa-2x" aria-hidden="true"></i><span><?php echo $templatefields["txtphotos"]; ?></span></a>
				<a href="<?php echo $tour["JoinUrl"] . lang_join_suffix(); ?>"><i class="fa-solid fa-film fa-2x" aria-hidden="true"></i><span><?php echo $templatefields["txtcaps"]; ?></span></a>
				<a href="<?php echo $tour["JoinUrl"] . lang_join_suffix(); ?>"><i class="fa-solid fa-comments fa-2x" aria-hidden="true"></i><span><?php echo $templatefields["txtcomments"]; ?></span></a>
				<a href="<?php echo $tour["JoinUrl"] . lang_join_suffix(); ?>"><i class="fa-solid fa-download fa-2x" aria-hidden="true"></i><span><?php echo $templatefields["txtdownload"]; ?></span></a>
				<a href="#favorite" onclick="javascript:Swal.fire({icon:'error', text:'<?php echo $templatefields['txtmembersonly']; ?>'}); return false;"><i class="fa-solid fa-heart-circle-check fa-2x" aria-hidden="true"></i><span><span><?php echo $templatefields["txtaddtofavorites"]; ?></span></a>
			</div>
			<div class="trailer-cats genres">
				<?php LoadTemplate("components/list_genres.tpl"); ?>
			</div>
			<div class="trailer-cats tags">
				<div class="list tags-list"><i class="fa-solid fa-hashtag" aria-hidden="true"><span><?php echo $templatefields["txttags"]; ?></span></i><?php LoadTemplate("components/list_tags.tpl", ["class" => "rounded"]); ?></div>
			</div>
		</div>
	</section>
	<section class="container">
		<div class="main-header-title">
			<div class="holder">
				<h2><?php echo $templatefields["txtmoreupdates"]; ?></h2>
				<a href="<?php echo $areaurl . lang_prefix(); ?>categories/movies/1/latest/"><?php echo $templatefields["txtviewall"]; ?>&nbsp;<i class="fa-solid fa-arrow-right-long"></i></a>
			</div>
		</div>
		<div class="grid grid-videos">
			<?php
			if ($tour['PaginateTourThumbs'] == 1) {
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
				shuffle($tourthumbs);
				foreach ($tourthumbs as $key => $set) {
					$media = $api->getContent(["id" => $set["Id"]]);
					foreach ($media->content['vids'] as $k => $l) {
						foreach ($l as $m => $n) {
							if ($n['name'] == '720p' || $n['name'] == '1080p') $bitrates[] = "HD";
							if ($n['name'] == '4K') $bitrates[] = "4K";
						}
					}
					if ($tour['NumPerPageThumb'] > $i) {
						LoadTemplate("components/thumb_video.tpl", ["set" => $set, "prefer" => 'vids', "counter" => $i, "layout" => $layout, "bitrates" => $bitrates]);
						$i++;
					}
					$bitrates = array();
				}
			?>
		</div>
		<a href="<?php echo $areaurl . lang_prefix(); ?>models/1/latest/" class="button button-load-more button-outline"><?php echo $templatefields["txtviewall"]; ?></a>
	<?php
			} else {
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
				shuffle($tourthumbs);
				foreach ($tourthumbs as $key => $set) {
					$media = $api->getContent(["id" => $set["Id"]]);
					foreach ($media->content['vids'] as $k => $l) {
						foreach ($l as $m => $n) {
							if ($n['name'] == '720p' || $n['name'] == '1080p') $bitrates[] = "HD";
							if ($n['name'] == '4K') $bitrates[] = "4K";
						}
					}
					if ($tour['NumPerPageThumb'] > $i) {
						LoadTemplate("components/thumb_video.tpl", ["set" => $set, "prefer" => 'vids', "counter" => $i, "layout" => $layout, "bitrates" => $bitrates]);
						$i++;
					}
					
					// Show 8 videos in 'More updates'. The total is set to 24 from the admin dashboard, this cuts it to 8.
					if ($i >= 8) {
						break;
					}
					$bitrates = array(); 
				}
			}
	?>
	<?php if ($tour['PaginateTourThumbs'] !== 1) { ?>
</div>
<?php } ?>
</section>
</div>
<?php LoadTemplate("tour/template_sections/footer.tpl"); ?>