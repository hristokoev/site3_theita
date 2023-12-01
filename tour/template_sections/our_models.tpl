<?php if (!isset($individual_update) && !empty($toprated['models'])) { ?>
	<?php $usepriority = 103; ?>
	<?php
	$modelObj = $api->getModels([
		"sort" => "date",
		"numperpage" => 6,
		"subsiteid" => $subsite['Id']
	]);
	foreach ($modelObj->models as $model) {
		$videoObj = $api->getSets(["model_filter" => $model['Id'],]);
	?>
		<div class="wrap">
			<div class="thumb">
				<div class="thumb-holder hover">
					<a href="<?php echo Sets_URL(["id" => $model["Id"], "seoname" => $model["SEOname"], "model" => $model]); ?>" title="<?php echo $model["ModelName"]; ?>">
						<?php if (Filter_SFW()) { ?>
							<img src="https://dummyimage.com/800x1067/c6d5d4/000&text=+" alt="">
						<?php } else { ?>
							<?php LoadTemplate("components/image_model.tpl", ["model" => $model, "priority" => "103", "loading" => "lazy"]); ?>
						<?php } ?>
					</a>
				</div>
				<div class="secondary">
					<h4><a href="<?php echo Sets_URL(["id" => $model["Id"], "seoname" => $model["SEOname"], "model" => $model]); ?>" title="<?php echo $model["ModelName"]; ?>"><?php echo $model["ModelName"]; ?></a></h4>
					<span>
						<?php
						if ($videoObj->settotal == 1) {
							echo $videoObj->settotal . ' ' . $templatefields["txtscene"];
						} else {
							echo $videoObj->settotal . ' ' . $templatefields["txtscenes"];
						}
						?>
					</span>
				</div>
			</div>
		</div>
	<?php } ?>
<?php } ?>