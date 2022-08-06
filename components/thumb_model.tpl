<?php $usepriority = 103; ?>
<div class="wrap">
		<div class="thumb">
			<div class="thumb-holder hover">
				<a href="<?php echo Sets_URL(["id" => $model["Id"], "seoname" => $model["SEOname"], "model" => $model]); ?>" title="<?php echo $model["ModelName"]; ?>">
					<?php LoadTemplate("components/image_model.tpl", ["model" => $model, "priority" => $usepriority]); ?>
				</a>
			</div>
			<div class="secondary">
				<h4><a href="<?php echo Sets_URL(["id" => $model["Id"], "seoname" => $model["SEOname"], "model" => $model]); ?>" title="<?php echo $model["ModelName"]; ?>"><?php echo $model["ModelName"]; ?></a></h4>
				<span>
					<?php
					if ($model["setcount"] == 1) {
						echo $model["setcount"] . ' ' . $templatefields["txtscene"];
					} else {
						echo $model["setcount"] . ' ' . $templatefields["txtscenes"];
					}
					?>
				</span>
			</div>
		</div>
</div>