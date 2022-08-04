<?php

$arr = json_decode($arr, true);
$images = array();

?>

<section class="container">
	<div class="grid grid-deals">
		<?php foreach ($arr as $deal) { ?>
		<div class="wrap">
			<div class="thumb">
				<div class="thumb-holder">
					<a href="<?php echo $deal["redirect"]; ?>">
						<img src="<?php echo $GLOBALS["areaurl"] . $deal["images"][array_rand($deal["images"])]; ?>" alt="">						
					</a>
				</div>
				<div class="secondary">
					<h4><a href="<?php echo $deal["redirect"]; ?>"><?php echo $deal["title"]; ?></a></h4>
					<span><?php echo $deal["subtitle"]; ?></span>
				</div>
			</div>
		</div>
		<?php } ?>
	</div>
</section>