<div class="main">
	<section class="container">
		<div class="page-header">
			<h1 class="page-title"><?php echo $templatefields["h1_genres"]; ?></h1>
			<h2 class="page-subtitle"><?php echo $templatefields["h2_genres"]; ?></h2>
		</div>
		<div class="grid grid-genres">
			<?php
			foreach ($categories['Areas']['cats']['Categories']['cats'] as $cat) {
				$setobj = $api->getSets(["category_filter" => [$cat["Id"]], "numperpage" => 10000]);
				if ($setobj->settotal > 0) {
					$thumb_var = $cat['info']['thumbs']; ?>
					<div class="wrap">
						<div class="thumb">
							<div class="thumb-holder">
								<a href="<?php echo custom_Category_Landing_URL(["id" => $cat["Id"], "seoname" => $cat["SEOname"], "s" => "d", "category" => $cat]) ?>">
									<?php StdCatImage(array("category" => $cat, "usepriority" => "34", "alt" => "", "class" => "thumbs")); ?>
								</a>
							</div>
							<div class="secondary">
								<h4><?php echo $cat["Title"]; ?></h4>
								<span>
									<?php
									if ($setobj->settotal == 1) {
										echo $setobj->settotal . ' scene';
									} else {
										echo $setobj->settotal . ' scenes';
									}
									?>
								</span>
							</div>
						</div>
					</div>
			<?php }
			} ?>
		</div>
	</section>
</div>