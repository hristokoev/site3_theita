<?php $arr = json_decode($arr, true); ?>
<section class="container">
	<div class="grid grid-deals">
		<?php foreach ($arr as $partner) {
		$randomKey = array_rand($partner, 1);
		$deal = $partner[$randomKey]; ?>
		<div class="wrap">
			<div class="thumb">
				<div class="thumb-holder">
					<a href="<?php echo $deal["redirect"]; ?>" target="_blank">
						<img src="<?php echo "https://vangoren.com/" . $deal["image"]; ?>" alt="">						
					</a>
				</div>
				<div class="secondary">
					<h4><a href="<?php echo $deal["redirect"]; ?>" target="_blank"><?php echo $deal["title"]; ?></a></h4>
					<span><?php echo $deal["subtitle"]; ?></span>
				</div>
			</div>
		</div>
		<?php } ?>
	</div>
</section>