<?php if (!isset($individual_update) && !empty($toprated['models'])) { ?>
	<?php $usepriority = 103; ?>
	<?php
	$modelObj = $api->getModels([
		"sort" => "date",
		"numperpage" => 6,
	]);
	foreach ($modelObj->models as $model) {
	?>
		<div class="wrap">
			<div class="thumb">
				<div class="thumb-holder hover">
					<a href="<?php echo Sets_URL(["id" => $model["Id"], "seoname" => $model["SEOname"], "model" => $model]); ?>" title="<?php echo $model["ModelName"]; ?>">
						<?php LoadTemplate("components/image_model.tpl", ["model" => $model, "priority" => $usepriority]); ?>
					</a>
				</div>
				<div class="secondary">
					<h4><?php echo $model["ModelName"]; ?></h4>
					<span>
						<?php
						if ($model["setcount"] == 1) {
							echo $model["setcount"] . ' scene';
						} else {
							echo $model["setcount"] . ' scenes';
						}
						?>
					</span>
				</div>
			</div>
		</div>
	<?php } ?>
<?php } ?>