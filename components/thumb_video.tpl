<?php
$ahref = "";
$onclick = "";
$today = date("Y-m-d H:i:s");
if (!isset($usepriority)) {
	if (isset($GLOBALS["tour"])) {
		$usepriority = "14,20,21,22,23,24,25";
	} else {
		$usepriority = "14,20,21,22,23,24,25";
	}
}
$url = ($url) ? $url : $areaurl;
$hType = (isset($set["info"]["totals"]["types"]["highres"])) ? 1 : 0;
$vType = (isset($set["info"]["totals"]["types"]["vids"])) ? 1 : 0;
$usetype = "";
if ($prefer && isset($set["info"]["totals"]["types"][$prefer])) {
	$usetype = $prefer;
} else if ($vType) {
	$usetype = "vids";
} else if ($hType) {
	$usetype = "highres";
} else if (array_not_empty($set["info"]["totals"]["types"])) {
	$usetype = each($set["info"]["totals"]["types"]);
	$usetype = $usetype["key"];
}
if (isset($GLOBALS["tour"])) {
	$ahref = Trailer_URL(["id" => $set["Id"], "seoname" => $set["SEOname"], "set" => $set]);
} else {	
	if ($today > $set["AppearDate"]) {
		if (isset($trial)) {
			if (in_array($set["Id"], $trial['allowrecent']) || empty($trial['allowrecent'])) {
				$ahref = $url . Gallery_URL(["type" => $usetype, "id" => $set["Id"], "seoname" => $set["SEOname"], "set" => $set]);
			} else {
				$ahref = $trial['videourl'];
			}
		} else {
			$ahref = $url . Gallery_URL(["type" => $usetype, "id" => $set["Id"], "seoname" => $set["SEOname"], "set" => $set]);
		}
	} else {
		$onclick = 'javascript:(Swal.fire("' . $templatefields["txtcoming"] . '&nbsp;' . $set["AppearDate"] . '"))';
	}
}
?>
<div class="wrap <?php echo $class; ?>">
	<div class="thumb">
		<div class="thumb-holder">
			<a href="<?php echo $ahref; ?>" onclick="<?php echo $onclick; ?>" title="<?php echo $set["Title"]; ?>">
				<?php if (in_array("skeleton", $layout)) { ?>
					<!-- <div class="skeleton-thumb" style="width: 100%; height: 100%;"></div> -->
				<?php } ?>
				<?php StdImage(array("set" => $set, "usepriority" => $usepriority, "alt" => "", "class" => "thumbs")); ?>
				<div class="videoloadline"></div>				
				<div class="overlay">
					<span class="bitrate">
					<?php 
					if (in_array("bitrate", $layout)) {
						LoadTemplate("components/bitrate.tpl", ["icons" => $bitrates]); 
					}
					?>
					</span>				
					<?php if (in_array("duration", $layout)) { ?>
					<span class="duration"><?php LoadTemplate("components/info_length_short.tpl", ["set" => $set]); ?></span>
					<?php } ?>
				</div>				
			</a>
		</div>
		<?php if (isset($layout["info"])) { ?>
			<div class="thumb-info">
				<div class="desc">
					<?php if (in_array("model", $layout["info"])) { ?>
						<div class="model">
							<?php LoadTemplate("components/list_models.tpl", ["set" => $set, "modellimit" => "999", "today" => $today]); ?>
						</div>
					<?php } ?>
					<?php if (in_array("date", $layout["info"]) || in_array("stars", $layout["info"])) { ?>
						<div class="info">
							<?php if (in_array("date", $layout["info"])) { ?>
								<div class="date"><?php echo date("j F Y", strtotime($set["AppearDate"])); ?></div>
							<?php } ?>
							<?php if (in_array("stars", $layout["info"])) { ?>
								<div class="stars">
									<?php LoadTemplate("components/info_rating.tpl", ["id" => $set["Id"], "type" => "set", "rating" => $set["plg_ratings_rank"] / (($set["plg_ratings_total"]) ? $set["plg_ratings_total"] : 1) * 10]); ?>
								</div>
							<?php } ?>
						</div>
					<?php } ?>
				</div>
				<?php if (in_array("title", $layout["info"])) { ?>
					<h5 class="title"><a href="<?php echo $ahref; ?>" onclick="<?php echo $onclick; ?>" title="<?php echo $set["Title"]; ?>"><?php echo $set["Title"]; ?></a></h5>
				<?php } ?>
			</div>
		<?php } ?>
	</div>
</div>