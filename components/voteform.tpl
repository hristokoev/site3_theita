<?php
if (empty($plugins["ratings"])) return;
if (!isset($type)) {
	echo "type not set";
	return;
}
$voted = 0;
if ($type == "set" && !empty($voted_sets[$id])) {
	$rated = $voted_sets[$id];
	$voted = 1;
}
if ($type == "model" && !empty($voted_models[$id])) {
	$rated = $voted_models[$id];
	$voted = 1;
}
if ($type == "dvd" && !empty($voted_dvds[$id])) {
	$rated = $voted_dvds[$id];
	$voted = 1;
}
$starclass = ($has_username) ? "rating-voteable" : "rating-nonvoteable";
?>
<div class="rating-box" data-voted="<?php echo $voted ?>" data-rating="<?php echo $rated ?>" data-type="<?php echo $type; ?>" data-id="<?php echo $id ?>">
	<form>
		<?php
		if ($has_username) {
			for ($pos = 5; $pos >= 1; $pos--) {
				if ($voted) { ?>
					<input class="star star-<?php echo $pos . ' ' . $starclass; ?>" id="star-<?php echo $pos; ?>" type="radio" name="star" <?php if ($pos == $rated / 2) echo 'checked'; ?> />
					<label data-pos="<?php echo $pos; ?>" class="star star-<?php echo $pos . ' ' . $starclass; ?>" for="star-<?php echo $pos; ?>"></label>
					<?php
				} else {
					$rated = $$type["PointsRank"] / ($$type["PointsTot"] > 0 ? $$type["PointsTot"] : 1) * 10;
					for ($pos = 5; $pos >= 1; $pos--) { ?>
						<input class="star star-<?php echo $pos; ?><?php if ($pos == $rated / 2 + 0.5) echo ' half' ?>" id="star-<?php echo $pos; ?>" type="radio" name="star" <?php if ($pos == $rated / 2 || $pos == $rated / 2 + 0.5) echo 'checked'; ?> />
						<label data-pos="<?php echo $pos; ?>" class="star star-<?php echo $pos . ' ' . $starclass; ?><?php if ($pos == $rated / 2 + 0.5) echo ' half' ?>" for="star-<?php echo $pos; ?>"></label>
				<?php
					}
				}
			}
		} else {
			$rated = $$type["PointsRank"] / ($$type["PointsTot"] > 0 ? $$type["PointsTot"] : 1) * 10;
			for ($pos = 5; $pos >= 1; $pos--) { ?>
				<input class="star star-<?php echo $pos; ?><?php if ($pos == $rated / 2 + 0.5) echo ' half' ?>" id="star-<?php echo $pos; ?>" type="radio" name="star" <?php if ($pos == $rated / 2 || $pos == $rated / 2 + 0.5) echo 'checked'; ?> disabled />
				<label data-pos="<?php echo $pos; ?>" class="star star-<?php echo $pos . ' ' . $starclass; ?><?php if ($pos == $rated / 2 + 0.5) echo ' half' ?>" for="star-<?php echo $pos; ?>"></label>
		<?php
			}
		}
		?>
	</form>
</div>