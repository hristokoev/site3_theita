<?php $usepriority = 103; ?>
<div class="wrap">
	<a href="<?php echo Sets_URL(["id" => $model["Id"], "seoname" => $model["SEOname"], "model" => $model]); ?>" title="<?php echo $model["ModelName"]; ?>">
		<div class="thumb">
			<div class="thumb-holder hover">
				<?php LoadTemplate("components/image_model.tpl", ["model" => $model, "priority" => $usepriority]); ?>
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
	</a>
</div>