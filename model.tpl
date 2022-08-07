<?php
LoadTemplate("template_sections/header.tpl", ["pagename" => "models", "seokey" => $model["SEOkey"], "seodesc" => $model["SEOdesc"]]);
$modelSets = $api->getSets(["model_filter" => [$model['Id']]]);
$mcats = array();
$m_sets = array();
foreach ($modelSets->sets as $set) {
	$m_sets[] = $set["info"]["categories"];
	foreach ($set["info"]["categories"] as $catitem) {
		$mcats[] = $catitem;
	}
}
$bitrates = array();
?>
<div class="main">
	<section class="container">
		<div class="model-bio">
			<div class="model-image">
				<?php LoadTemplate("components/image_model.tpl", ["model" => $model, "priority" => "103"]); ?>
			</div>
			<div class="model-info">
				<div class="model-title">
					<h1><?php echo $model['ModelName']; ?></h1>
					<div class="genres">
						<?php
						LoadTemplate("components/list_model_genres.tpl", ["m_sets" => array_unique($m_sets)]);
						?>
					</div>
				</div>
				<div class="model-rating">
					<?php
					$el1 = (isset($model["PointsRank"]) && $model["PointsRank"] != "") ? $model["PointsRank"] : 10;
					$el2 = (isset($model["PointsTot"]) && $model["PointsTot"] > 0) ? $model["PointsTot"] : 10;
					$rating = round($el1 / $el2 * 10);
					LoadTemplate("components/voteform.tpl", ["id" => $model["Id"], "type" => "model", "rated" => $rating]);
					?>
				</div>
				<div class="model-details">
					<?php if (strlen(implode($model['extrafields'])) != 0) { ?>
						<div class="stats">
							<?php if ($model['extrafields']['age'] != '') { ?>
								<div class="stats-item">
									<?php echo $templatefields["txtage"]; ?>
									<span class="item-text"><?php echo $model['extrafields']['age']; ?></span>
								</div>
							<?php } ?>
							<?php if ($model['extrafields']['nationality'] != '') { ?>
								<div class="stats-item">
									<?php echo $templatefields["txtnationality"]; ?>
									<span class="item-text"><?php echo $model['extrafields']['nationality']; ?></span>
								</div>
							<?php } ?>
							<?php if ($model['extrafields']['measurements'] != '') { ?>
								<div class="stats-item">
									<?php echo $templatefields["txtmeasurements"]; ?>
									<span class="item-text"><?php echo $model['extrafields']['measurements']; ?></span>
								</div>
							<?php } ?>
							<?php if ($model['extrafields']['sign'] != '') { ?>
								<div class="stats-item">
									<?php echo $templatefields["txtastrologicalsign"]; ?>
									<span class="item-text"><?php echo $model['extrafields']['sign']; ?></span>
								</div>
							<?php } ?>
							<?php if ($model['extrafields']['funfact'] != '') { ?>
								<div class="stats-item">
									<?php echo $templatefields["txtfunfact"]; ?>
									<span class="item-text"><?php echo $model['extrafields']['funfact']; ?></span>
								</div>
							<?php } ?>
							<?php if ($model['extrafields']['turnons'] != '') { ?>
								<div class="what_turns">
									<?php echo $templatefields["txtturnons"]; ?>
									<span class="item-text"><?php echo $model['extrafields']['turnons']; ?></span>
								</div>
							<?php } ?>
						</div>
					<?php } ?>
					<div class="tags">
						<span class="tags-title"><?php echo $templatefields["txttags"]; ?>: </span>
						<span class="tags-list">
							<?php
							LoadTemplate("components/list_model_tags.tpl", ["cats" => array_unique($mcats), "m_sets" => array_unique($m_sets)]);
							?>
						</span>
					</div>
				</div>
				<div class="model-description">
					<p><?php echo $model['extrafields']['bio']; ?></p>
					<span class="fade">
						<span class="more"><i class="fa-solid fa-angles-down"></i></span>
						<span class="close" style="display: none;"><i class="fa-solid fa-xmark"></i></span>
					</span>
				</div>				
			</div>
		</div>
	</section>
	<section class="container">
		<div class="page-subheader">
			<h3 class="page-title"><?php echo $templatefields["txtfeaturing"] . ' ' . $model["ModelName"]; ?></h3>
		</div>
		<div class="grid grid-videos">
			<?php
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
			$i = 0;
			foreach ($sets as $k => $set) {
				$media = $api->getContent(["id" => $set["Id"]]);
				foreach ($media->content['vids'] as $k => $l) {
					foreach ($l as $m => $n) {
						if ($n['name'] == '720p' || $n['name'] == '1080p') $bitrates[] = "HD";
						if ($n['name'] == '4K') $bitrates[] = "4K";
					}
				}
				if (true || (($k) >= (($onpage - 1) * $numperpage) && ($k) < (($onpage) * $numperpage))) {
					LoadTemplate("components/thumb_video.tpl", ["set" => $set, "counter" => $i, "layout" => $layout, "bitrates" => $bitrates]);
				}
				$i++;
				$bitrates = array();
			}
			?>
		</div>
	</section>
</div>
<script>
	let toggle = false;
	let pHeight = $(".model-description p").height();
	$(window).on("load", function() {
		if ($(".model-description p").height() < 72) {
			$(".fade").hide();
		} else if ($(".model-description p").height() >= 72) {
			$(".model-description").height("4.5rem");
		}
		if ($(".model-description p").html().length > 0) {
			$(".model-description").css("margin", "0 0 2rem");
		}
	});
	$(".model-description").on("click", function() {
		if (toggle == false) {
			$(".fade").css("background", "transparent");
			$(".model-description").height(pHeight);
			$(".more").hide();
			$(".close").show();
			toggle = true;
		} else if (toggle == true) {
			$(".fade").css("background", "");
			$(".model-description").height("4.5rem");
			$(".more").show();
			$(".close").hide();
			toggle = false;
		}
	});
</script>
<?php include "template_sections/footer.tpl"; ?>